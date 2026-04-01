# AGENTS.md

## Project Snapshot
- `BioScope` is a SwiftUI iOS app focused on a curated biodiversity browsing experience (dark-first, science-oriented visual language).
- App entry is `BioScopeApp.swift` -> `ContentView.swift` and forces dark appearance with `.preferredColorScheme(.dark)`.
- Navigation is intentionally custom: default `NavigationBar` and `TabBar` are hidden in `ContentView.swift` to use project-specific glass components.

## Architecture and Data Flow
- UI-first structure: `Views/` for screens, `Components/` for reusable UI, `Models/` for domain structs, `Data/MockData.swift` as the in-memory source of truth.
- Current data flow is static and synchronous: views read directly from `MockData` (`HomeView`, `FavoritesView`, `ProfileView`, `TaxonomyExplorerView`). There is no networking/service layer yet.
- `Tab` routing enum lives in `Components/LiquidGlassTabBar.swift`; if adding tabs, update both the enum and `TabView` mapping in `ContentView.swift`.
- `Species` and `TaxonomyNode` use generated `UUID()` identifiers (`Models/Species.swift`, `Models/Taxonomy.swift`), so IDs are not stable across app launches.

## UI and Interaction Conventions
- Liquid glass style is limited to functional chrome (navigation header / tab bar), not content cards (see README + `LiquidGlassNavigationBar.swift`, `LiquidGlassTabBar.swift`).
- Shared color tokens come from `Color` extensions in `Components/LiquidGlassTabBar.swift` (`customBackground`, `customSurface`, `customCyan`, `Color(hex:)`). Reuse these before adding new hard-coded colors.
- Home tab animation system is tokenized in `HomeCardMotionTokens` (`Views/HomeView.swift`) and includes reduced-motion branching via `@Environment(\.accessibilityReduceMotion)`.
- Card-to-detail continuity uses matched geometry (`SpeciesCardView` + `CardDetailOverlay` in `Views/HomeView.swift`), so preserve `animationNamespace`/`animationID` wiring when editing card transitions.

## Change Workflow (OpenSpec)
- Feature changes are tracked under `openspec/changes/<change-id>/` with `proposal.md`, `design.md`, `tasks.md`, and per-change specs.
- Existing active patterns:
  - Home card motion requirements: `openspec/changes/home-tab-appstore-card-animations/specs/home-tab-appstore-card-animations/spec.md`
  - Glass tab bar requirements: `openspec/changes/ios26-glass-tab-bar-effect/specs/ios26-glass-tab-bar/spec.md`
- When implementing UI motion/styling changes, align behavior with those spec scenarios before editing visuals.

## Build, Run, and Validation
- Open in Xcode: `BioScope.xcodeproj` (shared scheme: `BioScope`).
- CLI build command (derived from project layout/scheme):
  - `xcodebuild -project BioScope.xcodeproj -scheme BioScope -configuration Debug -destination 'platform=iOS Simulator,name=iPhone 16' build`
- There are currently no test targets in `BioScope.xcodeproj/xcshareddata/xcschemes/BioScope.xcscheme` (`<Testables>` is empty), so validation is primarily simulator/manual regression.
- For animation or glass-style edits, manually regression-check: tab switching, safe-area layout on home-indicator devices, home card tap/close transitions, and reduced-motion behavior.

## Practical Editing Rules for This Repo
- Keep top-level pages vertically scrollable with a reserved bottom spacer (`Spacer().frame(height: 120)`) to avoid overlap with custom tab bar.
- Preserve top padding patterns (`.padding(.top, 100)`) used to offset custom navigation header.
- Prefer extending existing reusable components (`SpeciesCardView`, `TaxonomyNodeView`, glass bars) rather than introducing one-off duplicated UI blocks.

