## Purpose
Define the expected App Store style card motion behavior for the home tab, including floating feedback, continuous card-to-detail transitions, grouped card expand/collapse animation, and accessibility-aware motion adaptation across iPhone size classes.

## Requirements

### Requirement: Home cards SHALL provide App Store style floating motion feedback
The system SHALL render home tab cards with subtle floating motion during initial appearance and scrolling, using deterministic motion tokens that preserve readability and interaction stability.

#### Scenario: Initial card entrance
- **WHEN** the home tab first renders visible cards
- **THEN** each card appears with a short staggered entrance combining opacity and small positional offset

#### Scenario: Scroll-linked floating feedback
- **WHEN** the user scrolls the home card list
- **THEN** visible cards apply lightweight floating/parallax feedback without obscuring card content or reducing tap accuracy

### Requirement: Card tap SHALL use continuous transition into detail
The system SHALL animate card-to-detail navigation with continuous visual transition, including geometry continuity, corner interpolation, and content fade orchestration.

#### Scenario: Tap to detail transition
- **WHEN** a user taps a card in the home tab
- **THEN** the selected card transitions into the detail screen with continuous geometry and no abrupt full-screen jump

#### Scenario: Return transition continuity
- **WHEN** the user navigates back from detail to home
- **THEN** the detail view transitions back to the originating card position and restores list state smoothly

### Requirement: Grouped cards SHALL support aggregate expand/collapse animation
The system SHALL support aggregate animations for grouped card modules, including collapsed summary state and expanded list state, with explicit transition states.

#### Scenario: Expand grouped cards
- **WHEN** a user expands a grouped card module
- **THEN** grouped cards animate from aggregated summary to expanded items with stable ordering and focus

#### Scenario: Collapse grouped cards
- **WHEN** a user collapses an expanded grouped module
- **THEN** cards animate back to the aggregated summary state without overlapping artifacts

### Requirement: Motion behavior SHALL adapt for accessibility and device classes
The system SHALL provide reduced-motion alternatives and maintain animation correctness across compact and large iPhone layouts.

#### Scenario: Reduced motion enabled
- **WHEN** the OS Reduce Motion setting is enabled
- **THEN** card transitions switch to reduced-motion variants that keep interaction semantics unchanged

#### Scenario: Device size adaptation
- **WHEN** the app runs on compact and large iPhone screens
- **THEN** card animation anchors, spacing, and touch targets remain valid with no clipping or off-screen jumps
