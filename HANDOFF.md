# Fidilia — Handoff

Last updated: 2026-09-01

## Read this first

Fidilia is a local-only iPhone/macOS remembrance app, not a habit tracker or task manager. The most important failure mode is accidentally adding productivity pressure or social-feed interaction patterns because they are conventional.

Before changing behavior, read:

1. `docs/PRODUCT.md`
2. `docs/DECISIONS.md`
3. `docs/UX_SPEC.md`
4. `docs/ARCHITECTURE.md`
5. `PROGRESS.md`

## Product name

**Fidilia**.

The GitHub repository is still named `tilia`; this is only a repository naming detail.

## Non-negotiable current product rules

- User content stays local unless explicitly exported.
- No accounts/cloud content database.
- No notifications/reminders/alarms.
- No streaks, due dates, progress percentages, milestones, subtasks, or “next action” system.
- No photos/media.
- No swipe actions.
- No custom fade/cross-dissolve transitions.
- Records are past/present only, never future-planned entries.
- Memory dates support day/month/year precision.
- Daily shows all active Records, including Records linked to Directions/Pursuits.
- Direction does not complete.
- Path is derived from Direction-linked Records.
- Pursuit may complete/reopen but remains retrospective.
- Every user-content object can be archived or deleted.
- Delete is actual deletion; no Recently Deleted.
- Deleting a Direction/Pursuit never cascades to linked Records.
- Destructive copy is neutral; never use phrases such as `This cannot be undone`.
- App Lock uses system device-owner authentication; no custom PIN.
- App Lock must hide content in app-switcher snapshots.
- No ads/subscriptions/donations/tip jar. App intended to be free.
- No conventional light/dark toggle.
- Color picker permits any supported color.
- Surprise Color may generate any supported color with no aesthetic filtering, including repeated/similar colors.

## Current technical state

The repository started empty. Documentation and a Swift package core have now been bootstrapped.

The native Xcode iOS/macOS app targets have **not yet been generated**. This is intentional: do not hand-author an unvalidated `.pbxproj` remotely. Create/validate targets in Xcode on a Mac, then commit the generated project.

## Immediate next task

Open/clone the repository on macOS and validate `Package.swift` with Xcode/Swift tooling. Then create the Fidilia application project/targets and implement the first vertical slice:

```text
Daily → Add Record → Save → Daily → Record Detail
```

Start with SwiftData persistence for `MemoryRecord`. Direction/Pursuit can follow after the first vertical slice proves persistence, navigation, and theme behavior.

## Architecture reminders

- Keep `MemoryDate` precision explicit; never fake missing day/month components.
- Archive is `isArchived`; Delete removes the object.
- Use non-cascading relationships from Direction/Pursuit to Records.
- Keep preferences separate from user-content SwiftData.
- Use semantic theme tokens; never sanitize the user's chosen canvas color.
- Do not create a ViewModel for every screen by habit.

## Documentation discipline

Whenever a session changes product behavior or implementation status:

1. update `docs/DECISIONS.md` if a durable decision changed/was added;
2. update `PROGRESS.md` with evidence-based completed/next items;
3. update this `HANDOFF.md` so a fresh session can resume without relying on chat history;
4. update `README.md` only when the public project overview changes materially.

Do not mark implementation tasks complete unless code exists and has been validated as far as the available environment permits.