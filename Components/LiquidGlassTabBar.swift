import SwiftUI

enum Tab {
    case home
    case explore
    case favorites
    case profile
}

struct LiquidGlassTabBar: View {
    @Binding var selectedTab: Tab

    var body: some View {
        HStack(spacing: 0) {
            TabBarItem(icon: "house.fill", title: "首页", tab: .home, selectedTab: $selectedTab)
            TabBarItem(icon: "safari.fill", title: "探索", tab: .explore, selectedTab: $selectedTab)
            TabBarItem(icon: "heart.fill", title: "收藏", tab: .favorites, selectedTab: $selectedTab)
            TabBarItem(icon: "person.fill", title: "个人", tab: .profile, selectedTab: $selectedTab)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 12)
        .background(.ultraThinMaterial)
        .environment(\.colorScheme, .dark) // Force dark material
        .clipShape(Capsule())
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
        .padding(.horizontal, 24)
        .padding(.bottom, 24)
    }
}

struct TabBarItem: View {
    let icon: String
    let title: String
    let tab: Tab
    @Binding var selectedTab: Tab

    private var isSelected: Bool {
        selectedTab == tab
    }

    var body: some View {
        Button(action: {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                selectedTab = tab
            }
        }) {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.system(size: 20, weight: isSelected ? .bold : .regular))

                Text(title)
                    .font(.system(size: 10, weight: isSelected ? .bold : .medium, design: .monospaced))
                    .textCase(.uppercase)
            }
            .foregroundColor(isSelected ? Color("CyanAccent") : Color.gray)
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity)
            .background(
                ZStack {
                    if isSelected {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color("CyanAccent").opacity(0.2))
                    }
                }
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
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
