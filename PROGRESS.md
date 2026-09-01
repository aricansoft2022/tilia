# Fidilia — Progress

Last updated: 2026-09-01

## Current phase

Foundation / architecture bootstrap.

## Completed

- [x] Product concept and vocabulary established.
- [x] Daily / Direction / Path / Pursuit / Remember relationships established.
- [x] Archive vs Delete semantics established.
- [x] Neutral deletion-language rule established.
- [x] App Lock behavior established.
- [x] Local-only / no-account / no-notification constraints established.
- [x] Monetization explicitly excluded.
- [x] Photo/media support explicitly excluded.
- [x] Swipe actions explicitly excluded.
- [x] Native navigation motion selected; custom fades excluded.
- [x] Free color-picker appearance model established.
- [x] Unrestricted Surprise Color behavior established.
- [x] Day/month/year memory-date precision established.
- [x] iPhone information architecture defined.
- [x] macOS split-view direction defined.
- [x] Edge cases and deletion semantics documented.
- [x] Product name selected: Fidilia.
- [x] Repository baseline documentation created.
- [x] Swift core package bootstrap added.

## In progress / next vertical slice

1. Validate the core Swift package in Xcode on macOS.
2. Create native Fidilia iOS and macOS app targets in Xcode.
3. Add SwiftData `MemoryRecord`, `Direction`, and `Pursuit` models with non-cascading relationships.
4. Implement ThemeManager and semantic foreground contrast on top of unrestricted canvas colors.
5. Implement iPhone shell with four tabs.
6. Implement first working vertical slice: `Daily → Add Record → Save → Daily → Record Detail`.
7. Add tests for archive/delete relationship behavior once SwiftData models exist.
8. Update this file and HANDOFF after each meaningful implementation step.

## Deliberately not started yet

- App icon / branding artwork
- App Store metadata
- trademark filing
- cloud sync
- notifications
- analytics
- monetization
- photo support
- import merge semantics
- multi-window macOS behavior

## Definition of first usable milestone

A locally running iPhone build where the user can:

- open Fidilia;
- choose a canvas color;
- create a text Record with day/month/year precision;
- see it in Daily;
- open and edit it;
- archive, restore, or delete it;
- quit/relaunch and retain data locally.

No Direction/Pursuit implementation is required to call this first vertical slice usable.