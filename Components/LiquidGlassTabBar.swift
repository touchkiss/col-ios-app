import SwiftUI

enum Tab {
    case home
    case search
    case timeline
    case explore
    case profile
}

struct LiquidGlassTabBar: View {
    @Binding var selectedTab: Tab
    let bottomSafeInset: CGFloat

    @Environment(\.colorScheme) private var colorScheme

    private var style: GlassTabBarStyle {
        GlassTabBarStyle(
            material: .ultraThinMaterial,
            borderColor: colorScheme == .dark ? Color.white.opacity(0.28) : Color.black.opacity(0.15),
            borderWidth: 1,
            highlight: LinearGradient(
                colors: colorScheme == .dark 
                    ? [Color.white.opacity(0.36), Color.white.opacity(0.06)]
                    : [Color.white.opacity(0.8), Color.white.opacity(0.2)],
                startPoint: .top,
                endPoint: .bottom
            ),
            highlightInset: 1.5,
            shadowColor: colorScheme == .dark ? Color.black.opacity(0.3) : Color.black.opacity(0.12),
            shadowRadius: 16,
            shadowYOffset: 8,
            innerHorizontalPadding: 8,
            innerVerticalPadding: 12,
            outerHorizontalPadding: 20,
            bottomInsetSpacing: 8,
            minBottomPadding: 12,
            selectionAnimationDuration: 0.16
        )
    }

    var body: some View {
        HStack(spacing: 0) {
            TabBarItem(icon: "house.fill", title: "首页", tab: .home, selectedTab: $selectedTab)
            TabBarItem(icon: "magnifyingglass", title: "搜索", tab: .search, selectedTab: $selectedTab)
            TabBarItem(icon: "clock.arrow.trianglehead.counterclockwise.rotate.90", title: "演化", tab: .timeline, selectedTab: $selectedTab)
            TabBarItem(icon: "safari.fill", title: "探索", tab: .explore, selectedTab: $selectedTab)
            TabBarItem(icon: "person.fill", title: "个人", tab: .profile, selectedTab: $selectedTab)
        }
        .padding(.horizontal, style.innerHorizontalPadding)
        .padding(.vertical, style.innerVerticalPadding)
        .background {
            Capsule()
                .fill(style.material)
                .overlay {
                    Capsule()
                        .strokeBorder(style.borderColor, lineWidth: style.borderWidth)
                }
                .overlay {
                    Capsule()
                        .fill(style.highlight)
                        .padding(style.highlightInset)
                        .blendMode(.screen)
                        .allowsHitTesting(false)
                }
        }
        .clipShape(Capsule())
        .shadow(color: style.shadowColor, radius: style.shadowRadius, x: 0, y: style.shadowYOffset)
        .padding(.horizontal, style.outerHorizontalPadding)
        .padding(.bottom, max(style.minBottomPadding, bottomSafeInset + style.bottomInsetSpacing))
    }
}

struct TabBarItem: View {
    let icon: String
    let title: String
    let tab: Tab
    @Binding var selectedTab: Tab
    @Environment(\.colorScheme) private var colorScheme

    private var isSelected: Bool {
        selectedTab == tab
    }

    private var style: GlassTabBarStyle { .default }

    private var selectedForeground: Color {
        colorScheme == .dark ? Color.white : Color.black.opacity(0.86)
    }

    private var unselectedForeground: Color {
        colorScheme == .dark ? Color.white.opacity(0.68) : Color.black.opacity(0.56)
    }

    private var selectedChip: Color {
        colorScheme == .dark ? Color.white.opacity(0.16) : Color.white.opacity(0.42)
    }

    var body: some View {
        Button(action: {
            withAnimation(.easeInOut(duration: style.selectionAnimationDuration)) {
                selectedTab = tab
            }
        }) {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.system(size: 19, weight: .semibold))
                    .opacity(isSelected ? 1.0 : 0.78)

                Text(title)
                    .font(.system(size: 10, weight: .semibold, design: .monospaced))
                    .opacity(isSelected ? 1.0 : 0.76)
                    .textCase(.uppercase)
            }
            .foregroundColor(isSelected ? selectedForeground : unselectedForeground)
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity)
            .background(
                ZStack {
                    if isSelected {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(selectedChip)
                            .overlay {
                                RoundedRectangle(cornerRadius: 16)
                                    .strokeBorder(Color.white.opacity(colorScheme == .dark ? 0.14 : 0.28), lineWidth: 1)
                            }
                            .transition(.opacity)
                    }
                }
            )
            .contentShape(Rectangle())
        }
        .frame(minHeight: 44)
        .buttonStyle(PlainButtonStyle())
    }
}

private struct GlassTabBarStyle {
    let material: Material
    let borderColor: Color
    let borderWidth: CGFloat
    let highlight: LinearGradient
    let highlightInset: CGFloat
    let shadowColor: Color
    let shadowRadius: CGFloat
    let shadowYOffset: CGFloat
    let innerHorizontalPadding: CGFloat
    let innerVerticalPadding: CGFloat
    let outerHorizontalPadding: CGFloat
    let bottomInsetSpacing: CGFloat
    let minBottomPadding: CGFloat
    let selectionAnimationDuration: Double

    static let `default` = GlassTabBarStyle(
        material: .ultraThinMaterial,
        borderColor: Color.white.opacity(0.28),
        borderWidth: 1,
        highlight: LinearGradient(
            colors: [Color.white.opacity(0.36), Color.white.opacity(0.06)],
            startPoint: .top,
            endPoint: .bottom
        ),
        highlightInset: 1.5,
        shadowColor: Color.black.opacity(0.22),
        shadowRadius: 16,
        shadowYOffset: 8,
        innerHorizontalPadding: 8,
        innerVerticalPadding: 12,
        outerHorizontalPadding: 20,
        bottomInsetSpacing: 8,
        minBottomPadding: 12,
        selectionAnimationDuration: 0.16
    )
}

// Helper extension for custom colors
extension Color {
    static let customBackground = Color(hex: "111316")
    static let customSurface = Color(hex: "1e2023")
    static let customCyan = Color(hex: "00daf3")
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
