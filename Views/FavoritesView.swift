import SwiftUI

struct FavoritesView: View {
    @State private var selectedFilter = "全部"
    let filters = ["全部", "哺乳类", "鸟类", "爬行类", "两栖类"]

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 32) {
                // Header
                VStack(alignment: .leading, spacing: 8) {
                    Text("SPECIMEN ARCHIVES".uppercased())
                        .font(.system(size: 14, weight: .bold, design: .monospaced))
                        .foregroundColor(Color.customCyan)
                        .tracking(2)

                    Text("我的收藏")
                        .font(.system(size: 40, weight: .heavy))
                        .foregroundColor(.white)

                    Rectangle()
                        .fill(Color.customCyan)
                        .frame(width: 48, height: 4)
                        .cornerRadius(2)
                }
                .padding(.horizontal, 24)
                .padding(.top, 100) // NavBar spacer

                // Filters
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(filters, id: \.self) { filter in
                            Button(action: {
                                withAnimation {
                                    selectedFilter = filter
                                }
                            }) {
                                HStack(spacing: 4) {
                                    Text(filter)
                                        .font(.system(size: 14, weight: selectedFilter == filter ? .bold : .medium))
                                    if filter == "全部" {
                                        Text("08")
                                            .font(.system(size: 10, weight: .regular))
                                            .opacity(0.5)
                                    }
                                }
                                .padding(.horizontal, 24)
                                .padding(.vertical, 10)
                                .foregroundColor(selectedFilter == filter ? Color(hex: "004750") : Color(hex: "bbc9cc"))
                                .background(selectedFilter == filter ? Color.customCyan : Color(hex: "1e2023"))
                                .cornerRadius(20)
                            }
                        }
                    }
                    .padding(.horizontal, 24)
                }

                // Grid of Favorites
                LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)], spacing: 16) {
                    ForEach(MockData.favorites, id: \.id) { species in
                        SpeciesCardView(species: species, style: .bento)
                            .frame(height: 320)
                    }

                    // Empty Slot
                    VStack {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 40))
                            .foregroundColor(Color.gray.opacity(0.5))
                            .padding(.bottom, 8)
                        Text("探索更多物种\n并加入收藏")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .frame(height: 320)
                    .background(Color.customBackground)
                    .cornerRadius(16)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [8]))
                            .foregroundColor(Color.gray.opacity(0.3))
                    )
                }
                .padding(.horizontal, 24)

                // Insights Section
                VStack(alignment: .leading, spacing: 16) {
                    HStack(alignment: .top, spacing: 24) {
                        ZStack {
                            AsyncImage(url: URL(string: "https://lh3.googleusercontent.com/aida-public/AB6AXuBN5BehqCN3LNx-CRC15FEPGlT172yPWKwAK9fvXiDMy36Hqdn97U1olR07fuWCNYPj_kxldfcFV5fyz_ahDu1Opb0_r84yAj4E2SeTQC-TQLmNRd8b5lf6sWQ3L9_Ab_RzIds0EugyWdwJCDU6ek2xDuDDUGhc9jifBRSHwUYx8ztTbHZ7Mrr3Jj731b3dxVWYLpCKg9wNz59hNEmOroR-sUHSG8nEU9nXi-FJNBJQJKNZ7FX_VOavHuQlI0sYZ72ocFswadhbrTg")) { image in
                                image.resizable().aspectRatio(contentMode: .fill)
                            } placeholder: {
                                Color.gray.opacity(0.3)
                            }
                            .frame(width: 120, height: 160)
                            .clipShape(RoundedRectangle(cornerRadius: 16))

                            Color.customCyan.opacity(0.2).blendMode(.overlay)
                        }

                        VStack(alignment: .leading, spacing: 12) {
                            Text("收藏见解")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(Color.customCyan)

                            Text("您的收藏库主要集中在**全球濒危物种**。这反映了您对生物多样性保护的深度关注。系统已为您自动整理了相关的栖息地保护计划和科研动态。")
                                .font(.system(size: 14, weight: .regular))
                                .foregroundColor(Color(hex: "bbc9cc"))
                                .lineSpacing(4)

                            HStack(spacing: 12) {
                                Button("导出报告") { }
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundColor(Color.customCyan)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(Color.customCyan.opacity(0.1))
                                    .cornerRadius(8)

                                Button("管理归档") { }
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundColor(.gray)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.3), lineWidth: 1))
                            }
                            .padding(.top, 4)
                        }
                    }
                    .padding(24)
                    .background(Color(hex: "282a2d").opacity(0.4))
                    .cornerRadius(24)
                    .overlay(RoundedRectangle(cornerRadius: 24).stroke(Color.gray.opacity(0.1), lineWidth: 1))
                }
                .padding(.horizontal, 24)

                Spacer().frame(height: 120)
            }
        }
        .background(Color.customBackground.ignoresSafeArea())
    }
}
