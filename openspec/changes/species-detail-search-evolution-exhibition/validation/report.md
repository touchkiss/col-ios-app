## Manual Regression Report

Date: 2026-03-31
Change: species-detail-search-evolution-exhibition

### Scope
- Search flow (empty state, keyword filtering, no-result state)
- Detail transition from Home/Search/Timeline
- Back behavior and tab stability
- Timeline browsing readability across compact/large iPhone layouts

### Checklist
- [x] Search page shows guidance state when query is empty.
- [x] Search filters by name, scientificName, and tags in real time.
- [x] Search no-result state provides refinement guidance and clear action.
- [x] Home card taps open shared `SpeciesDetailView`.
- [x] Search result taps open shared `SpeciesDetailView`.
- [x] Timeline card taps open shared `SpeciesDetailView`.
- [x] Returning from detail preserves originating tab context.
- [x] Timeline sections render in deterministic configured order.
- [x] Timeline cards are readable and not clipped in vertical scrolling.

### Rollback Path
If production issues appear after this change:
1. Revert tab exposure by removing `.search` and `.timeline` entries from tab mapping in `ContentView.swift` and `Components/LiquidGlassTabBar.swift`.
2. Keep data model additions in `Data/MockData.swift` (safe to retain) while disabling new entry points.
3. Optionally remove `Views/SearchView.swift` and `Views/EvolutionTimelineView.swift` if full rollback is required.
4. Restore previous home-only detail entry flow by keeping `HomeView` with existing card interactions.

### Notes
Validation performed using static/mock data architecture only, no network dependencies.
