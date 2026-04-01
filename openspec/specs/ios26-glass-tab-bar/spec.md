## Purpose

Define the iOS 26-style glass tab bar behavior, visual states, and adaptation rules for the app's bottom navigation while preserving existing navigation logic.

## Requirements

### Requirement: Tab Bar SHALL render iOS 26 glass material
The system SHALL render the bottom tab bar using a glass-like material style with blur, translucency, highlight overlay, and subtle border, while preserving existing tab navigation behavior.

#### Scenario: Glass container is visible
- **WHEN** the app displays the main tab interface
- **THEN** the bottom tab bar is rendered with a translucent blurred background, visible edge border, and highlight layer

#### Scenario: Navigation behavior remains unchanged
- **WHEN** a user taps any tab item
- **THEN** the selected screen changes according to existing routing logic with no change to tab order or destination mapping

### Requirement: Tab item states SHALL provide consistent visual feedback
The system SHALL differentiate selected and unselected tab items with deterministic visual tokens (foreground color, emphasis level, and highlight intensity) and SHALL animate state transition smoothly.

#### Scenario: Selected tab state
- **WHEN** a tab item is currently selected
- **THEN** the item uses the selected visual tokens with stronger contrast and emphasis than unselected items

#### Scenario: Unselected tab state
- **WHEN** a tab item is not selected
- **THEN** the item uses unselected visual tokens that remain legible while visually subordinate to the selected item

#### Scenario: State transition animation
- **WHEN** selection changes from one tab item to another
- **THEN** the visual transition uses a short smooth animation without changing layout geometry or touch target size

### Requirement: Tab bar SHALL adapt across color schemes and device sizes
The system SHALL maintain readability and touch usability for the glass tab bar across light/dark appearance, different iPhone screen sizes, and safe area configurations.

#### Scenario: Light and dark mode readability
- **WHEN** the device appearance switches between light mode and dark mode
- **THEN** tab item labels and icons remain readable against the glass background in both modes

#### Scenario: Safe area compatibility
- **WHEN** the app runs on devices with bottom home indicator areas
- **THEN** the tab bar layout respects bottom safe area and keeps all tab targets fully tappable

#### Scenario: Compact and large device layouts
- **WHEN** the app runs on compact and large iPhone screens
- **THEN** the tab bar maintains consistent spacing, minimum tap target area, and no clipped visual layers