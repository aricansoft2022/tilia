# Fidilia — Decision Log

This file records product/technical decisions that future sessions should not casually rediscover or reverse.

## D-001 — Product name: Fidilia

**Decision:** Use `Fidilia` as the product name.

**Meaning:** coined from the ideas of Latin `fides` (faith/trust) and Greek `philia` (friendship/affectionate friendship), expressing “faith in friendship.”

**Repository note:** the GitHub repository is currently named `tilia`; repository rename is optional and not required for implementation correctness.

## D-002 — Records are retrospective

**Decision:** no future-dated Records.

**Reason:** future entries introduce planning/task semantics, which are explicitly outside the product.

## D-003 — Daily is a view, not a bucket

**Decision:** every active Record appears in Daily even when it was created from a Direction or Pursuit.

**Reason:** avoid fragmented record universes and classification pressure.

## D-004 — Direction never completes

**Decision:** Direction has no completed/failed status.

**Reason:** it represents an ongoing way of moving/living, not a finite objective.

## D-005 — Path is derived

**Decision:** Path is the chronological record history of a Direction, not an entity the user creates or manages.

## D-006 — Pursuit is finite but not project management

**Decision:** Pursuit may be completed/reopened but has no milestones, subtasks, due dates, next actions, percentage complete, or progress ring.

## D-007 — Archive and Delete are distinct everywhere

**Decision:** user-content objects may be archived or deleted.

Archive is reversible. Delete physically removes the object. No Recently Deleted area.

Deleting Direction/Pursuit does not cascade to Records.

## D-008 — Deletion language stays neutral

**Decision:** no `This cannot be undone`, `Are you absolutely sure?`, loss-framing, or emotional pressure.

A short confirmation is allowed solely as protection against an accidental tap.

## D-009 — Text only

**Decision:** no photo/media feature.

**Reason:** the app should leave imagery in the user's mind rather than becoming a photo journal; this also materially simplifies privacy, storage, export, and persistence.

## D-010 — No swipe actions

**Decision:** management actions are available after opening the object or through standard macOS context menus; no iPhone row swipes.

## D-011 — Native motion, no custom fade

**Decision:** prefer standard push/pop/sheet/tab/split-view navigation. Do not add custom fade/cross-dissolve transitions.

## D-012 — No conventional Dark Mode switch

**Decision:** appearance is driven by a user-selected canvas color, not a binary light/dark setting.

The user may select any supported color, including very dark colors. Foreground adapts for readability.

## D-013 — Surprise Color is genuinely unrestricted

**Decision:** app-generated surprise colors are not curated or filtered.

No saturation/brightness/hue limits, no similarity rejection, and no “pleasant color” algorithm. Repetition is valid random output.

## D-014 — No monetization

**Decision:** no ads, paid tier, subscription, donation prompt, or tip jar. Intended App Store price is free.

## D-015 — Local-only user content

**Decision:** no application cloud database/account. User controls export/import.

## D-016 — App Lock uses system authentication

**Decision:** optional App Lock reuses system owner authentication (Face ID/Touch ID/device authentication as available) and covers content before app-switcher snapshots.

No separate Fidilia PIN system.

## D-017 — Approximate memory dates are first-class

**Decision:** Record and Pursuit completion dates support day, month, or year precision and never fabricate missing precision.

## D-018 — Portable export should be versioned data, not SwiftData internals

**Decision:** prefer a versioned JSON archive. Validate import before replacing current data.

## D-019 — Free app does not imply open-source license

**Decision:** source license remains undecided. Do not add a license automatically merely because the distributed app will be free.