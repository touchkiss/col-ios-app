import SwiftUI

struct SpeciesDetailView: View {
    let species: Species
    @Environment(\.presentationMode) private var presentationMode

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                heroSection

                profileSection
                taxonomySection
                habitatSection
                conservationSection

                Spacer().frame(height: 48)
            }
            .padding(.bottom, 120)
        }
        .background(Color.customBackground.ignoresSafeArea())
        .edgesIgnoringSafeArea(.top)
        .overlay(
            LiquidGlassNavigationBar(title: "", showBackButton: true, action: {
                presentationMode.wrappedValue.dismiss()
            }),
            alignment: .top
        )
    }

    private var heroSection: some View {
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: URL(string: species.imageUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Color.gray.opacity(0.35)
            }
            .frame(height: 380)
            .clipped()

            LinearGradient(
                gradient: Gradient(colors: [.black.opacity(0.82), .black.opacity(0.2), .clear]),
                startPoint: .bottom,
                endPoint: .top
            )

            VStack(alignment: .leading, spacing: 8) {
                Text(species.name)
                    .font(.system(size: 42, weight: .black, design: .rounded))
                    .foregroundColor(.white)

                Text(species.scientificName)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(Color.customCyan)
                    .italic()

                Text("\(species.status.acronym) · \(species.status.rawValue)")
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                    .foregroundColor(Color(hex: "ffb4ab"))
                    .padding(.horizontal, 9)
                    .padding(.vertical, 4)
                    .background(Color(hex: "93000a").opacity(0.36))
                    .clipShape(Capsule())
            }
            .padding(.horizontal, 22)
            .padding(.bottom, 22)
        }
    }

    private var profileSection: some View {
        InfoSection(title: "Profile", subtitle: "基础信息") {
            VStack(alignment: .leading, spacing: 12) {
                Text(species.description)
                    .font(.system(size: 15, weight: .regular))
                    .foregroundColor(Color.white.opacity(0.82))
                    .lineSpacing(5)

                HStack(spacing: 8) {
                    metricChip(title: "Temp", value: species.averageTemp ?? "--")
                    metricChip(title: "Mass", value: species.mass ?? "--")
                    metricChip(title: "Length", value: species.length ?? "--")
                    metricChip(title: "Life", value: species.lifespan ?? "--")
                }
            }
        }
    }

    private var taxonomySection: some View {
        InfoSection(title: "Taxonomy", subtitle: "科学分类") {
            VStack(spacing: 8) {
                taxonomyRow(label: "Domain", value: species.domain)
                taxonomyRow(label: "Kingdom", value: species.kingdom)
                taxonomyRow(label: "Phylum", value: species.phylum)
                taxonomyRow(label: "Class", value: species.className)
                taxonomyRow(label: "Order", value: species.order)
                taxonomyRow(label: "Family", value: species.family)
                taxonomyRow(label: "Genus", value: species.genus)
            }
        }
    }

    private var habitatSection: some View {
        InfoSection(title: "Habitat", subtitle: "分布与生境") {
            VStack(alignment: .leading, spacing: 12) {
                HStack(spacing: 8) {
                    if let icon = species.habitatIcon {
                        Image(systemName: icon)
                            .foregroundColor(Color.customCyan)
                    }

                    Text(species.habitatName ?? "未知生境")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.white)

                    if let depth = species.depth {
                        Text(depth)
                            .font(.system(size: 11, weight: .semibold, design: .monospaced))
                            .foregroundColor(Color.white.opacity(0.65))
                    }
                }

                Text(species.distribution ?? "暂无分布描述")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(Color.white.opacity(0.78))
                    .lineSpacing(4)

                if let map = species.mapImageUrl {
                    AsyncImage(url: URL(string: map)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        Color.gray.opacity(0.3)
                    }
                    .frame(height: 170)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            }
        }
    }

    private var conservationSection: some View {
        InfoSection(title: "Conservation", subtitle: "保护状态") {
            VStack(alignment: .leading, spacing: 10) {
                Text("当前状态：\(species.status.rawValue)（\(species.status.acronym)）")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.white)

                Text("重点关注：\(species.tags.joined(separator: "、"))")
                    .font(.system(size: 13, weight: .regular))
                    .foregroundColor(Color.white.opacity(0.75))

                Text("建议持续监测栖息地变化、食物链压力与气候波动，以保障种群稳定。")
                    .font(.system(size: 13, weight: .regular))
                    .foregroundColor(Color.white.opacity(0.65))
                    .lineSpacing(4)
            }
        }
    }

    private func taxonomyRow(label: String, value: String) -> some View {
        HStack {
            Text(label.uppercased())
                .font(.system(size: 11, weight: .semibold, design: .monospaced))
                .foregroundColor(Color.customCyan)
            Spacer()
            Text(value)
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(.white)
                .multilineTextAlignment(.trailing)
        }
        .padding(.vertical, 5)
    }

    private func metricChip(title: String, value: String) -> some View {
        VStack(spacing: 4) {
            Text(title)
                .font(.system(size: 10, weight: .bold, design: .monospaced))
                .foregroundColor(Color.customCyan)
            Text(value)
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(.white)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 8)
        .background(Color(hex: "25282d"))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

private struct InfoSection<Content: View>: View {
    let title: String
    let subtitle: String
    @ViewBuilder let content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.white)
                    Text(subtitle.uppercased())
                        .font(.system(size: 10, weight: .bold, design: .monospaced))
                        .foregroundColor(Color.customCyan)
                }
                Spacer()
            }

            content
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.customSurface)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.white.opacity(0.08), lineWidth: 1))
        .padding(.horizontal, 20)
    }
}
