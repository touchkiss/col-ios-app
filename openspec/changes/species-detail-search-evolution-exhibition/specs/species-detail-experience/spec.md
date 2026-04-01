## ADDED Requirements

### Requirement: Species detail page SHALL present structured species knowledge
The system SHALL present a dedicated species detail page with clear sections for core profile, taxonomy, habitat and conservation information using the existing Species data model.

#### Scenario: Open detail from any species entry
- **WHEN** a user taps a species card from home, search results, or timeline exhibition
- **THEN** the app opens the same species detail page for that species

#### Scenario: Structured content sections are visible
- **WHEN** the species detail page loads
- **THEN** the page shows sectioned information including species name, scientific name, description, taxonomy fields, and conservation-relevant attributes

### Requirement: Species detail navigation SHALL preserve interaction continuity
The system SHALL preserve stable back navigation and state continuity when users enter and leave the species detail page.

#### Scenario: Return to previous list context
- **WHEN** a user navigates back from a species detail page
- **THEN** the app returns to the originating page context without changing selected tab unexpectedly

#### Scenario: Multiple entry points stay consistent
- **WHEN** the same species is opened from different pages
- **THEN** detail layout and interaction behavior remain consistent across entry points
