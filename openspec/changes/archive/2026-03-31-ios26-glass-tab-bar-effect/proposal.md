## Why

当前应用底部 Tab 栏为常规样式，缺少 iOS 26 视觉语言中的玻璃质感层次与动态通透反馈，导致整体观感与系统体验不一致。现在引入该效果可以提升界面现代感，并让导航组件与现有 Liquid Glass 组件风格统一。

## What Changes

- 为底部 Tab 栏增加 iOS 26 风格的玻璃效果（模糊、半透明、高光与边缘描边）。
- 在亮色与暗色模式下提供可读性稳定的前景色与背景材质参数。
- 为选中与未选中 Tab 状态定义一致的视觉反馈（包含层级、对比度与轻量动画过渡）。
- 为小屏与大屏设备定义统一布局规则，确保安全区与点击区域不退化。
- 保持现有导航行为与页面切换逻辑不变，仅升级表现层。

## Capabilities

### New Capabilities
- `ios26-glass-tab-bar`: 定义并实现底部 Tab 栏的 iOS 26 玻璃视觉规范、状态反馈与自适配规则。

### Modified Capabilities
- None.

## Impact

- 受影响代码：`Components/LiquidGlassTabBar.swift`、`ContentView.swift`（或 Tab 容器接入点）、可能涉及主题色与公共样式常量。
- API 影响：无外部 API 变更。
- 依赖影响：优先使用 SwiftUI 原生能力（Material/blur/overlay/mask）；不引入第三方依赖。
- 体验影响：底部导航视觉升级，交互路径保持一致，风险主要在可读性与低端设备渲染性能。