## 1. Data Modeling and Source Preparation

- [x] 1.1 Add timeline period model(s) and species-to-period mapping in Data/MockData.swift for exhibition rendering.
- [x] 1.2 Extend reusable mock query source for search filtering (name, scientificName, tags) while keeping data immutable at call sites.
- [x] 1.3 Add preview/sample entries to cover empty-state and multi-period scenarios.

## 2. Species Detail Experience

- [x] 2.1 Refine Views/SpeciesDetailView.swift into sectioned layout: profile, taxonomy, habitat, and conservation-focused information blocks.
- [x] 2.2 Ensure the detail page can be opened from home/search/exhibition using a unified Species input contract.
- [x] 2.3 Validate back navigation continuity and tab selection stability after returning from detail.

## 3. Search Discovery Page

- [x] 3.1 Create Views/SearchView.swift with search input, immediate local filtering, and default guidance state.
- [x] 3.2 Implement no-result state and tappable result rows/cards that navigate to the shared species detail page.
- [x] 3.3 Verify filtering performance and touch reliability on compact and large iPhone layouts.

## 4. Evolution Timeline Exhibition Page

- [x] 4.1 Create Views/EvolutionTimelineView.swift with chronological period sections and stable ordering.
- [x] 4.2 Render species entries inside each period section and route tap actions to shared detail page.
- [x] 4.3 Validate readability, spacing, and clipping of timeline cards across screen sizes.

## 5. Navigation Integration and Regression

- [x] 5.1 Update ContentView.swift tab/page mapping to expose search and timeline exhibition entry points without breaking existing home flow.
- [x] 5.2 Wire shared navigation helpers/state so home, search, and exhibition all open the same species detail behavior.
- [x] 5.3 Run manual regression for search, detail transition, back behavior, timeline browsing, and empty states; document rollback path in validation notes.
