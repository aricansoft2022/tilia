# Fidilia — Architecture Baseline

## Technology direction

- Swift
- SwiftUI
- SwiftData for persistent user content
- `@Observable`/SwiftUI environment for lightweight app services where appropriate
- LocalAuthentication for App Lock
- UserDefaults / AppStorage for installation preferences
- No CloudKit-backed user-content store
- No third-party state-management framework planned

The first implementation should remain close to native SwiftUI data flow. Add abstraction only when it removes a concrete problem.

## Persisted user-content entities

Only three primary user-content entities are required:

```text
MemoryRecord
Direction
Pursuit
```

Product vocabulary calls `MemoryRecord` a “Record”; the longer code name avoids ambiguous type naming.

Derived views are not entities:

```text
Daily      = active Records ordered by memory date
Path       = active Records linked to one Direction
Remember   = queries over active Records
Archive    = queries over archived entities
```

## Relationships

```text
MemoryRecord  * <----> *  Direction
MemoryRecord  * <----> *  Pursuit
```

Relationship deletion rules must be nullifying/non-cascading from Direction/Pursuit to Record. Deleting a Direction or Pursuit must not delete linked Records.

Deleting a Record naturally removes its relationships.

## Archive semantics

Archive is stored as `isArchived` on each user-content entity.

```text
active   = object exists, isArchived == false
archived = object exists, isArchived == true
deleted  = object no longer exists
```

Do not introduce `isDeleted`, `deletedAt`, or a hidden Recently Deleted database unless the product decision changes explicitly.

## MemoryDate

A memory date preserves user-supplied precision:

```text
year required
month optional
day optional
```

Invariant:

```text
day implies month
month implies year
```

A deterministic sort key may treat missing lower precision as zero for ordering, while display must retain the original precision.

Future-date validation belongs to Record creation/editing policy rather than corrupting the underlying date value type.

## Pursuit completion

Do not model Pursuit state as a single mutually exclusive enum because completion and archive are independent axes.

Recommended persisted shape:

```text
completion date/precision optional
isArchived Bool
```

Therefore valid combinations include active, completed, archived-active, and archived-completed.

## Preferences

Installation preferences are separate from user-content persistence:

- App Lock enabled
- fixed user color
- Surprise Color enabled
- current surprise color
- surprise interval bounds
- next surprise change date

Deleting all user content does not implicitly reset these installation preferences.

## Theme system

Views should not scatter hard-coded foreground/background colors. A ThemeManager derives semantic tokens from the selected canvas color:

- canvas
- primary foreground
- secondary foreground
- separators
- control surfaces
- control foreground

The selected or randomly generated canvas color is never altered for aesthetic reasons. Contrast is solved on foreground/control tokens.

Surprise Color generation must use unrestricted random RGB values within the supported color space. Similar/repeated colors are allowed.

## Surprise scheduling

No background scheduler is required.

Persist `nextColorChangeAt`. On foreground/activation:

1. if Surprise Color is disabled, do nothing;
2. if `now < nextColorChangeAt`, keep current color;
3. if due, generate a new unrestricted color;
4. choose a new random interval within user-selected bounds;
5. persist the next change date.

A timer may handle a due change while the app remains continuously active.

## Export / import

Preferred portable representation: versioned JSON rather than exposing SwiftData's internal SQLite store.

Conceptual format:

```json
{
  "formatVersion": 1,
  "records": [],
  "directions": [],
  "pursuits": []
}
```

Archive state and relationships are included. Deleted data is not.

MVP import semantics: validate first, then replace current user content atomically. Do not implement merge/conflict resolution until there is a demonstrated need.

Appearance and App Lock preferences are not part of content export by default.

## Platform shells

### iPhone

```text
TabView
├── Daily NavigationStack
├── Directions NavigationStack
├── Pursuits NavigationStack
└── Remember NavigationStack
```

Shared sheets/components include Record editor, Direction editor, Pursuit editor, date precision picker, and link picker.

### macOS

Use a native NavigationSplitView-style shell:

```text
Sidebar → content/timeline → selected Record detail
```

The business/data layer and feature content views should be shared where practical; navigation shells remain platform-specific.

## Core feature components

```text
RecordTimelineView
RecordRow
RecordDetailView
RecordEditorView
MemoryDatePicker
LinkPickerView

DirectionsView
DirectionDetailView
DirectionEditorView

PursuitsView
PursuitDetailView
PursuitEditorView
CompletePursuitView

RememberView
TimeBrowserView
RandomRecordView

ArchiveView
SettingsView
AppLockGate
```

Do not build separate visual Record components for Daily, Path, and Pursuit history unless a concrete UX need appears.

## Services

Likely lightweight services:

- RecordService
- DirectionService
- PursuitService
- ThemeManager
- AppLockManager
- ExportService
- ImportService

Avoid a ViewModel-per-screen pattern unless a screen accumulates state that genuinely benefits from one.

## Xcode bootstrap

This repository initially contains a Swift package for testable core value types and policy logic. The native iOS/macOS application targets should be generated/opened with Xcode on macOS rather than maintaining a hand-authored `.pbxproj` created without validation.

Once the app targets exist, keep the product docs and HANDOFF current in the same commits that change behavior.