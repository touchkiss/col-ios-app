## Why

首页 Tab 当前卡片交互偏静态，缺少 App Store 风格的动效节奏与层次感，导致内容吸引力和探索沉浸感不足。引入浮动、点击过渡与聚合动画可以提升信息浏览效率与视觉品质，并与 iOS 原生体验保持一致。

## What Changes

- 为首页卡片引入 App Store 风格的“浮动入场”与滚动视差反馈。
- 为卡片点击进入详情增加连续过渡动画（缩放、圆角过渡、层级遮罩与淡入内容）。
- 为多卡片分组模块增加“聚合/展开”动画，提升分组浏览与焦点切换体验。
- 为动效增加降级策略（低性能设备或减少动态效果场景下保持可用）。
- 保持首页数据结构与导航目标不变，仅升级交互与视觉反馈。

## Capabilities

### New Capabilities
- `home-tab-appstore-card-animations`: 定义首页卡片在浮动、点击、聚合三个关键场景下的动效行为、状态切换和可访问性要求。

### Modified Capabilities
- None.

## Impact

- 受影响代码：`Views/HomeView.swift`、`Components/SpeciesCardView.swift`、可能新增首页动效容器与状态管理辅助文件。
- API 影响：无外部 API 或后端契约变更。
- 依赖影响：使用 SwiftUI 原生动画能力（`matchedGeometryEffect`、`spring`、`phaseAnimator`/`keyframeAnimator` 等）；不引入第三方动画库。
- 测试影响：需要增加首页交互回归与不同设备/动态效果设置下的手动验证。