## ADDED Requirements

### Requirement: Species search page SHALL support immediate local discovery
The system SHALL provide a search page where users can input keywords and immediately filter species using local data without network dependency.

#### Scenario: Real-time filtering by keyword
- **WHEN** a user types text in the search input
- **THEN** the result list updates in real time based on species name or configured searchable fields

#### Scenario: Empty query state
- **WHEN** search input is empty
- **THEN** the page shows default guidance or curated starter content instead of an error state

### Requirement: Search results SHALL be actionable and stable
The system SHALL provide tappable result items that route to species detail while preserving readability and touch usability.

#### Scenario: Open detail from search result
- **WHEN** a user taps a species item in search results
- **THEN** the app navigates to the species detail page for that item

#### Scenario: No matching result state
- **WHEN** no species matches the current query
- **THEN** the page shows a clear no-result state with guidance to refine keywords
