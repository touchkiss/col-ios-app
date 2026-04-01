## ADDED Requirements

### Requirement: Evolution exhibition page SHALL organize species by historical periods
The system SHALL provide an exhibition page that groups species development records by historical periods on a timeline-like structure.

#### Scenario: Period-grouped content rendering
- **WHEN** a user opens the evolution exhibition page
- **THEN** the page renders ordered period groups and associated species entries for each period

#### Scenario: Chronological ordering
- **WHEN** multiple periods are displayed
- **THEN** period sections are shown in deterministic chronological order

### Requirement: Exhibition entries SHALL support species drill-down
The system SHALL allow users to open species detail from exhibition entries without losing navigation consistency.

#### Scenario: Open species from period section
- **WHEN** a user taps a species entry inside a period group
- **THEN** the app navigates to the corresponding species detail page

#### Scenario: Exhibition usability across device sizes
- **WHEN** the page is used on compact and large iPhone screens
- **THEN** timeline sections and cards remain readable, scrollable, and unclipped
