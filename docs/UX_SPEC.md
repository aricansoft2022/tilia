# Fidilia — UX Specification

## iPhone navigation

Primary tab bar:

1. Daily
2. Directions
3. Pursuits
4. Remember

Settings and Archive are secondary surfaces, not tabs.

No swipe actions are used anywhere.

## Daily

Daily is the default app surface and shows all non-archived Records in reverse chronological order, grouped by their stated memory date.

Record rows are not cards by default. Typography and spacing are the primary separators.

Example:

```text
Daily                                      +

September 1

Fed a stray cat near the park.

Finally understood why that chord
progression works.

August 29

Had coffee with an old friend.
```

An empty Daily may simply show `No records.` with the normal add control. The app never comments on how long Daily has been empty.

## Add Record

Presented as a standard sheet.

The text editor receives focus immediately. The minimum successful flow is:

`+ → type → Save`

Secondary controls:

- Date
- Add to…

No photo control exists.

No title is required.

`Add to…` supports multiple selections across existing Directions and Pursuits. Classification is always optional.

When Add Record is opened from a Direction or Pursuit, that context is preselected but removable.

## Record Detail

A normal navigation destination on iPhone and detail-column content on macOS.

Displays:

- memory date using the precision supplied by the user
- full Record text
- active linked Directions
- active linked Pursuits

Overflow actions:

- Edit
- Archive, or Restore when archived
- Delete

Delete confirmation is concise: `Delete this record?`

## Directions

Root list shows active Directions by name. It does not show percentages, counts, streaks, last-active dates, or progress visualization.

Creation requires:

- Name
- optional Note

No deadline, start date, target, priority, frequency, color, icon, or metric is required.

### Direction Detail / Path

The Direction title and optional note appear above the Path. Path is simply the timeline of active linked Records sorted by memory date.

Overflow actions:

- Edit
- Archive
- Delete

Deleting a Direction uses neutral scope copy, for example:

`Delete “Health”? Records connected to this Direction will stay in your records.`

Archived Directions disappear from normal Direction links and Path surfaces. Their relationships remain stored so Restore can reconstitute the Path.

## Pursuits

The root view contains Active and Completed sections once data exists. A Pursuit is created with:

- Name
- optional Note

No milestones, subtasks, deadlines, progress bars, or planned next steps.

### Pursuit Detail

Shows the Record history and optional completion metadata.

Active overflow actions:

- Edit
- Mark as Completed
- Archive
- Delete

Completed overflow actions:

- Edit
- Reopen
- Archive
- Delete

Completion date supports day, month, or year precision.

A completed Pursuit may still receive historical Records. Fidilia is recording history, not enforcing project-state chronology.

## Remember

MVP functions:

- Search
- Browse by Time
- Random Record

Only active Records participate.

### Search

Plain local text search. No AI or semantic search is required for MVP. Empty result: `No results.`

### Browse by Time

Only time periods containing Records are shown. Empty years/months are omitted; Fidilia does not visualize missing days or gaps.

### Random Record

Shows one eligible Record and, when more than one Record exists, an `Another` control.

The next Record should be selected without engagement scoring or relevance ranking. No animation is required when it changes.

## Archive

Archive is a secondary area with Records, Directions, and Pursuits.

Archived content is hidden from normal Daily, Remember, Search, Path, and Pursuit-history surfaces.

Restoring content preserves prior relationships.

Archive is reversible and may be performed without emotionally loaded warning copy. Delete retains a simple second-step confirmation to prevent accidental taps.

## Settings

```text
Settings

Privacy
  App Lock

Appearance
  Color

Data
  Export
  Import
  Delete All Data

Archive

About
```

No monetization-related settings exist.

## App Lock

If enabled:

1. content is covered before an app-switcher/background snapshot can expose it;
2. the app requests system owner authentication when foregrounded/opened;
3. successful authentication restores the user to the prior navigation state;
4. cancellation leaves a plain Locked surface with an Unlock action;
5. Fidilia does not invent a separate PIN fallback.

## Appearance / Color

The color picker is unrestricted.

The chosen color supplies the primary canvas/theme atmosphere. Foreground tokens adapt to maintain legibility, but Fidilia does not modify or reject the chosen color.

### Surprise Color

Optional mode. The user configures a random interval range. Fidilia stores the next due-change date and evaluates it when the app is active/foregrounded. It does not require notifications or a background service.

When generating a surprise color, every supported color is valid. Do not filter for saturation, brightness, hue, similarity to the previous color, or perceived attractiveness.

## Motion

Use native platform transitions:

- iPhone push/pop navigation
- standard sheets
- standard tab switching
- macOS split view and context menus

Do not add custom fades, cross-dissolves, hero animations, matched-geometry spectacle, confetti, or achievement animations.

## Accessibility

- Support Dynamic Type where applicable.
- VoiceOver should read a Record with its date in a meaningful order.
- Controls meet Apple minimum hit-target expectations.
- Information is never encoded only by color.
- Contrast/foreground adapts to the user-selected canvas color.