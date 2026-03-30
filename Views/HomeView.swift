import SwiftUI

struct HomeView: View {
    @State private var searchText = ""

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 32) {

                // Search Bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color.gray)
                    TextField("探索物种、栖息地或生态系统...", text: $searchText)
                        .foregroundColor(Color.white)
                    Image(systemName: "mic.fill")
                        .foregroundColor(Color.gray)
                }
                .padding()
                .background(Color(hex: "333538").opacity(0.4))
                .cornerRadius(12)
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray.opacity(0.2), lineWidth: 1))
                .padding(.top, 100) // Space for NavBar
                .padding(.horizontal, 24)

                // Featured Editorial Card
                VStack(alignment: .leading, spacing: 16) {
                    SpeciesCardView(species: MockData.polarBear, style: .hero)
                        .frame(height: 480)
                        .padding(.horizontal, 24)
                }

                // Deep Sea Wonders (Horizontal Scroll)
                VStack(alignment: .leading, spacing: 16) {
                    HStack(alignment: .bottom) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("OBSERVATION")
                                .font(.system(size: 10, weight: .bold, design: .monospaced))
                                .foregroundColor(Color.customCyan)
                                .tracking(2)
                            Text("深海奇观")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(.white)
                        }
                        Spacer()
                        HStack(spacing: 4) {
                            Text("查看全部")
                                .font(.system(size: 12, weight: .bold))
                            Image(systemName: "chevron.right")
                                .font(.system(size: 10, weight: .bold))
                        }
                        .foregroundColor(Color.customCyan)
                    }
                    .padding(.horizontal, 24)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            // Dummy views mapping to deep sea cards from design
                            ForEach(0..<3) { index in
                                DeepSeaCard(title: ["发光水母", "大王乌贼", "深海珊瑚礁"][index],
                                            subtitle: ["Cnidaria · 刺胞动物门", "Mollusca · 软体动物门", "Anthozoa · 珊瑚纲"][index],
                                            depth: ["2,500m DEPTH", "4,000m DEPTH", "800m DEPTH"][index],
                                            imageUrl: [
                                                "https://lh3.googleusercontent.com/aida-public/AB6AXuAuV6tJ5BGZCk6UL4bKOV36yY4U7YG_Bn58FcBwdvQ6Pxt2n109LbJnKMOolpGYI-m100gi0J7sNwpjD5ckbG4EodMy6dpNrcCwEHg6kFHWuFkLnDMSQC-De3cT14hXHiaRbJP-IYibgm4NXY_06WrbMhgnR_MyK6VRfEx5CWcWHD65fJK6n-6x_u9gMi4uT8wjPhczfjPAwWLWyS8Q-BRUlxvq12H-74DysHY4_VFMwvU5uNuH375KsRiy9Vmb_ZS_l9shbAg57No",
                                                "https://lh3.googleusercontent.com/aida-public/AB6AXuDXhcFKdRdSaBQAxBC5zg1WxNC6owMHbgvOhER97oqOo1WjCr7Sf7iBgugkYb8eaek4XR5sL56taIE6GsHnXTqMeIKSoPu7lawKSpSzFHeYHPe_USOpIXhUCRqFj5M0YBBIZJyBOMpY9Pg4eMgjwFaF67JB7knk01kcbgzv80Ie-MoIjGPzzEjoeFgUwbNL4escmqBEv_M9fGeQdg5ZRUOjcOLfde9IB9oJEmAEJwXlKTZfPeY2uaDKbPwg8D_YrrUFT19pt2ZCsF8",
                                                "https://lh3.googleusercontent.com/aida-public/AB6AXuCrRdm5cRuGBaitK9uqnDWxIR16AH85lke6fVYNMn2N0_a_wEIfhcwKkupBut9kMopwdXo0DLlOasM7pqXZ_0fOjXwnHWpqmrwnkORX_dV9vHVBB2D4j6QX3NCqDxYyx8WW9Jg0bm9KYIVEft5q5Qm0bwbkX-dxC3i1NsWXSL9sY4igaaziNz85fnku70OcKSO3Dpo963f3hnS7Sk8XLYo7XDo8JQyipdYHoaIw7oLgWVEbLt45MAu3402Bg_L9olSPawCs4fe6hHo"
                                            ][index])
                                .frame(width: 280, height: 380)
                            }
                        }
                        .padding(.horizontal, 24)
                    }
                }

                // Endangered Bento Layout
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Capsule().fill(Color.red).frame(width: 4, height: 32)
                        Text("濒危警报")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 24)

                    VStack(spacing: 16) {
                        SpeciesCardView(species: MockData.axolotl, style: .bento)
                            .frame(height: 300)

                        HStack(spacing: 16) {
                            SpeciesCardView(species: MockData.snowLeopard, style: .bento)
                                .frame(height: 200)
                            SpeciesCardView(species: MockData.emperorPenguin, style: .bento)
                                .frame(height: 200)
                        }
                    }
                    .padding(.horizontal, 24)
                }

                Spacer().frame(height: 120) // Bottom tab bar offset
            }
        }
        .background(Color.customBackground.ignoresSafeArea())
    }
}

// Deep Sea Helper View
struct DeepSeaCard: View {
    let title: String
    let subtitle: String
    let depth: String
    let imageUrl: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack(alignment: .topLeading) {
                AsyncImage(url: URL(string: imageUrl)) { image in
                    image.resizable().aspectRatio(contentMode: .fill)
                } placeholder: {
                    Color.gray.opacity(0.3)
                }
                .frame(width: 280, height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 12))

                Text(depth)
                    .font(.system(size: 10, weight: .bold, design: .monospaced))
                    .foregroundColor(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.black.opacity(0.6))
                    .cornerRadius(4)
                    .padding(16)
            }

            Text(title)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)

            Text(subtitle)
                .font(.system(size: 12, weight: .regular))
                .foregroundColor(.gray)
                .textCase(.uppercase)
                .tracking(1)
        }
    }
}
