# Fidilia

Fidilia is a local-only iPhone and macOS app for keeping short textual records of things a person wants to remember.

The product deliberately avoids task-management and habit-tracking pressure. It has no streaks, reminders, alarms, notifications, ads, subscriptions, donations, accounts, or cloud database.

## Core concepts

- **Daily** — the chronological view of active records.
- **Direction** — an ongoing direction in life with no completion state.
- **Path** — the chronological view of records linked to a Direction; not a stored entity.
- **Pursuit** — something with a natural endpoint that may be marked completed.
- **Remember** — search, time browsing, and random resurfacing of existing records.
- **Archive** — reversible removal from normal surfaces.
- **Delete** — actual deletion. Deleted objects are not retained by Fidilia.

Every record always belongs to the main chronological record history and may optionally be linked to any number of Directions and Pursuits.

## Product constraints

- Text only. No photos.
- No future-dated records.
- Records may use day, month, or year precision for older memories.
- Every user-content object can be archived or deleted.
- Deleting a Direction or Pursuit does not delete its linked Records.
- No swipe actions.
- No custom fade/cross-dissolve navigation transitions.
- Native platform navigation is preferred.
- Optional App Lock uses the device's system owner-authentication mechanism.
- App-switcher content must be covered while App Lock is active.
- Appearance is driven by a freely selectable color, not a light/dark toggle.
- Optional Surprise Color mode may select any color without aesthetic filtering; readable foreground colors adapt to it.

## Repository status

The repository is at the architecture/bootstrap stage. Product decisions are documented before Xcode target generation so implementation can proceed without rediscovering product behavior.

Start with:

1. [`docs/PRODUCT.md`](docs/PRODUCT.md)
2. [`docs/UX_SPEC.md`](docs/UX_SPEC.md)
3. [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md)
4. [`docs/DECISIONS.md`](docs/DECISIONS.md)
5. [`PROGRESS.md`](PROGRESS.md)
6. [`HANDOFF.md`](HANDOFF.md)

## Platforms

- iPhone / iOS
- macOS
- SwiftUI
- SwiftData for user content
- Local storage only

## Licensing

No source-code license has been selected yet. The app is intended to be distributed free of charge; that decision is separate from the repository's source-code license.