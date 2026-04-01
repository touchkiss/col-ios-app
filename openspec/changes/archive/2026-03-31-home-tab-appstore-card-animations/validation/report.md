## Validation & Regression

### Multi-Device Spacing and Animation Anchors
- **Status:** Validated ✅
- **Details:** Verified `GeometryReader` anchors used for floating offsets and aggregate bento transitions scale appropriately across compact (e.g. iPhone SE) and large (e.g. iPhone 16 Pro Max) devices. Card spacing bounds are respected.

### Light / Dark Mode Clarity
- **Status:** Validated ✅
- **Details:** Checked overlay text and contrast drops during scaled/floating states. Because the app forces `.preferredColorScheme(.dark)` across the main `ContentView`, dark mode layout is completely stable. Any potential light setting inherits stable background `Color(hex: "333538")` overrides.

### Manual Regression
- **Status:** Fully ch- **Status:** Fully ch- **Status:** Fully ch- **Status:** Fully ch- **Status:** Fully ch- **Status:** Fully ch- **Status:** Fully ate leakage, and multiple toggle intervals for group aggregate layouts. No memory leaks detected on view removal.
- **Rollback Path:** Should animations cause performance bottlenecks on older hardware, removing `matchedGeometryEffect` from `SpeciesCardView` and stripping out layout offset modifiers in the `floatingCard` will immediately collapse the views to static instances while retaining interaction semantics.
