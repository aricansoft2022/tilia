# Fidilia — Product Specification

Status: baseline product definition

## Purpose

Fidilia is a private, local-only place to keep short textual records of things a person wants to remember: ordinary good moments, small steps in a long-term direction, and progress within a finite pursuit.

The app does not tell the user what to do next. It records what the user has already done or experienced.

## Core vocabulary

### Record
The atomic user-created item. A Record is text plus a memory date. It may optionally be linked to any number of Directions and Pursuits.

### Daily
The main chronological view of all active Records. Daily is a view, not a stored entity. A Record created inside a Direction or Pursuit also appears in Daily.

### Direction
An ongoing direction in life with no completion state. Examples: living more healthily, making music part of life, spending more time outside.

A Direction can be active, archived, restored, or deleted. It is never “failed” or “completed.”

### Path
The chronological view of active Records linked to one Direction. Path is derived data, not a stored entity and not something the user creates separately.

### Pursuit
Something with a natural endpoint, such as earning a degree or releasing a first song. A Pursuit may be marked completed, reopened, archived, restored, or deleted.

Completion is descriptive, not a progress system. There are no milestones, percentages, deadlines, subtasks, or next actions.

### Remember
A user-invoked way to revisit existing active Records through search, browsing by time, or a random Record. Fidilia never pushes resurfaced memories through notifications.

### Archive
A reversible visibility state. Archived content is removed from normal surfaces but remains stored with its relationships intact.

### Delete
Actual deletion. Fidilia does not keep a Recently Deleted area or hidden soft-delete state.

Deleting a Direction or Pursuit removes its relationships but does not delete linked Records.

## Record dates

Fidilia supports three levels of date precision:

- exact day: `September 1, 2026`
- month: `September 2026`
- year: `2026`

The app must never invent missing precision. A month-only memory must not be displayed as the first day of that month.

Future-dated Records are not supported. Fidilia records the present and past; it is not a planning tool.

## Privacy

- No user account.
- No application cloud database.
- No analytics requirement in the product design.
- User content remains on the device unless the user explicitly exports it.
- Export/import is user-controlled.
- Optional App Lock reuses the operating system’s device-owner authentication.
- When App Lock is enabled, app-switcher snapshots must not expose content.

## Appearance

Fidilia does not have a conventional light/dark theme switch.

The user may freely choose the app’s main color with a color picker. The chosen color may be light, dark, saturated, muted, or anything else the picker permits. Foreground content adapts for legibility; the selected background color is not aesthetically corrected.

An optional Surprise Color mode lets Fidilia choose a new color after user-configurable random intervals. The generated color is genuinely unrestricted within the supported color space: no hue, saturation, brightness, similarity, or “pleasantness” filters. Repeated or similar colors are allowed because random means random.

No custom fade or cross-dissolve accompanies color changes.

## Content and interaction constraints

- Text only; no photos or media attachments.
- No Record title requirement.
- No tags in the first version.
- No favorites.
- No mood scoring.
- No streaks.
- No reminders.
- No alarms.
- No notifications.
- No due dates.
- No progress percentages or rings.
- No activity metrics such as “last active.”
- No swipe actions.
- No motivational success copy, confetti, badges, or achievement haptics.
- No custom fade/cross-dissolve navigation transitions.
- Native push, pop, sheet, tab, split-view, and standard macOS context-menu behavior are preferred.

## Product language

Copy is short, functional, neutral, and non-judgmental.

Examples:

- `No records.`
- `No Directions.`
- `No Pursuits.`
- `No results.`
- `Delete this record?`
- `Delete “Health”? Records connected to this Direction will stay in your records.`

Do not use copy such as:

- “This cannot be undone.”
- “Are you absolutely sure?”
- “You will lose your memories.”
- “Start your journey.”
- “You have not recorded anything today.”

Deletion is a normal user action, not a moral or emotional failure.

## Monetization

None.

- No advertising.
- No subscription.
- No paid tier.
- No donation request.
- No tip jar.

The intended app distribution price is free. Source-code licensing is a separate decision and is currently undecided.

## Non-goals

Fidilia is not a task manager, planner, habit tracker, project manager, social network, photo journal, cloud diary, coaching system, or quantified-self dashboard.