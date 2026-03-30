import SwiftUI

struct LiquidGlassNavigationBar: View {
    let title: String
    var showBackButton: Bool = false
    var action: (() -> Void)? = nil

    var body: some View {
        HStack {
            if showBackButton {
                Button(action: {
                    action?()
                }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color(hex: "00daf3"))
                }
            } else {
                Button(action: {}) {
                    Image(systemName: "line.3.horizontal")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color(hex: "00daf3"))
                }
            }

            Spacer()

            Text(title.uppercased())
                .font(.system(size: 20, weight: .black, design: .rounded))
                .foregroundColor(Color(hex: "00daf3"))
                .tracking(2)

            Spacer()

            // Profile / Action button placeholder
            AsyncImage(url: URL(string: MockData.currentUser.avatarUrl)) { image in
                image.resizable()
                     .aspectRatio(contentMode: .fill)
            } placeholder: {
                Color.gray
            }
            .frame(width: 36, height: 36)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color(hex: "00daf3").opacity(0.3), lineWidth: 1))
        }
        .padding(.horizontal, 20)
        .padding(.top, 50) // safe area spacing approximate
        .padding(.bottom, 16)
        .background(.ultraThinMaterial)
        .environment(\.colorScheme, .dark)
    }
}
