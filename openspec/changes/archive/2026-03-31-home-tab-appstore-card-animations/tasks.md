## 1. Motion Foundation and Tokens

- [x] 1.1 Define reusable home-card motion tokens (timing, spring, opacity, scale, corner radius) in a centralized SwiftUI constants structure.
- [x] 1.2 Add animation namespace/state plumbing in home card container to support matched geometry and deterministic transition phases.
- [x] 1.3 Implement reduced-motion branching that swaps movement-heavy transitions for lightweight fade/scale alternatives.

## 2. Floating and Scroll Feedback

- [x] 2.1 Implement staggered entrance animation for visible cards on home tab first render.
- [x] 2.2 Implement scroll-linked floating/parallax feedback with bounded offsets to preserve readability and tap reliability.
- [x] 2.3 Verify floating behavior does not break list performance or cause touch target drift.

## 3. Tap Transition and Navigation Continuity

- [x] 3.1 Implement card-to-detail matched geometry transition with corner/shape interpolation.
- [x] 3.2 Implement detail-to-home return transition that restores originating card and scroll context smoothly.
- [x] 3.3 Validate navigation destinations and existing business interactions remain unchanged after animation integration.

## 4. Group Aggregate Expand/Collapse

- [x] 4.1 Implement grouped-card aggregate state model (collapsed, expanding, expanded, collapsing) to serialize transitions.
- [x] 4.2 Implement expand animation from aggregate summary into ordered child cards with stable focus behavior.
- [x] 4.3 Implement collapse animation back to aggregate summary without overlap artifacts or state desynchronization.

## 5. Multi-Device and Regression Validation

- [x] 5.1 Validate animation anchors, spacing, and clipping on compact and large iPhone simulators.
- [x] 5.2 Validate light/dark mode visual clarity during animated states and tune contrast tokens if needed.
- [x] 5.3 Run manual regression for home scroll, tap, back navigation, and grouped module interactions; document rollback path to static transition behavior if issues occur.