## Why

当前应用缺少完整的物种浏览闭环：物种详情信息表达较弱，搜索入口与结果体验不足，也没有按历史年代展示多物种演化进程的展览页面。这导致用户难以高效发现目标物种并理解长期演化脉络。

## What Changes

- 增强物种详情页的信息结构与可视化层次（基础信息、分类信息、栖息地与保护状态等）。
- 新增搜索页，支持按名称与标签快速检索物种并进入详情页。
- 新增按历史年代组织的演化展览页，支持浏览多个物种在时间轴上的发展进程。
- 统一三类页面的导航衔接与状态还原，保持现有首页与底部导航行为稳定。
- 保持现有 MockData 驱动方式，不引入后端 API 依赖。

## Capabilities

### New Capabilities
- `species-detail-experience`: 定义物种详情页的信息展示结构、交互行为与返回连续性。
- `species-search-discovery`: 定义搜索输入、结果过滤与结果到详情页的导航行为。
- `evolutionary-timeline-exhibition`: 定义按历史年代组织的演化展览页面、时间段分组和物种卡片浏览规则。

### Modified Capabilities
- None.

## Impact

- 受影响代码：Views/SpeciesDetailView.swift、Views/HomeView.swift、ContentView.swift、Data/MockData.swift，并可能新增 Views/SearchView.swift 与 Views/EvolutionTimelineView.swift。
- API 影响：无外部 API 变更。
- 依赖影响：继续使用 SwiftUI 原生组件与动画能力，不新增第三方依赖。
- 测试影响：需要补充手动回归，覆盖搜索路径、详情跳转、年代展览浏览与返回行为。
