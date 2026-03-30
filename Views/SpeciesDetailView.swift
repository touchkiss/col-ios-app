import SwiftUI

struct SpeciesDetailView: View {
    let species: Species
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // Hero Image
                ZStack(alignment: .bottomLeading) {
                    AsyncImage(url: URL(string: species.imageUrl)) { image in
                        image.resizable()
                             .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        Color.gray.opacity(0.3)
                    }
                    .frame(height: 500)
                    .clipped()

                    LinearGradient(
                        gradient: Gradient(colors: [.black.opacity(0.8), .black.opacity(0.2), .clear]),
                        startPoint: .bottom,
                        endPoint: .top
                    )

                    VStack(alignment: .leading, spacing: 8) {
                        HStack(spacing: 8) {
                            Text("Endangered Status".uppercased())
                                .font(.system(size: 10, weight: .bold, design: .monospaced))
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color(hex: "0b5345"))
                                .foregroundColor(Color(hex: "86c5b3"))
                                .cornerRadius(4)

                            Text("\(species.status.acronym) · \(species.status.rawValue)".uppercased())
                                .font(.system(size: 10, weight: .bold, design: .monospaced))
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color(hex: "93000a").opacity(0.4))
                                .foregroundColor(Color(hex: "ffb4ab"))
                                .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color(hex: "ffb4ab").opacity(0.2), lineWidth: 1))
                                .cornerRadius(4)
                        }

                        Text(species.name)
                            .font(.system(size: 56, weight: .black))
                            .foregroundColor(.white)
                            .tracking(-1)

                        Text(species.scientificName)
                            .font(.system(size: 24, weight: .light))
                            .foregroundColor(Color.customCyan)
                            .italic()
                            .tracking(-0.5)
                    }
                    .padding(24)
                }

                // Content Canvas
                VStack(spacing: 32) {
                    // Stats Bento
                    HStack(spacing: 12) {
                        StatBox(icon: "thermometer", title: "Average Temp", value: species.averageTemp ?? "--")
                        StatBox(icon: "scalemass.fill", title: "Mass (Adult)", value: species.mass ?? "--")
                        StatBox(icon: "ruler.fill", title: "Length", value: species.length ?? "--")
                        StatBox(icon: "clock.fill", title: "Lifespan", value: species.lifespan ?? "--")
                    }

                    // Narrative
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Text("简介")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(.white)
                            Rectangle().fill(Color.gray.opacity(0.2)).frame(height: 1)
                        }

                        Text(species.description)
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(Color(hex: "bbc9cc"))
                            .lineSpacing(6)
                    }

                    // Taxonomy Connectors
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Text("科学分类")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(.white)
                            Rectangle().fill(Color.gray.opacity(0.2)).frame(height: 1)
                        }

                        VStack(alignment: .leading, spacing: 24) {
                            TaxonomyLine(level: "Kingdom", value: species.kingdom)
                            TaxonomyLine(level: "Phylum", value: species.phylum)
                            TaxonomyLine(level: "Class", value: species.className)
                            TaxonomyLine(level: "Order", value: species.order)
                            TaxonomyLine(level: "Family", value: species.family)
                        }
                        .padding(.leading, 32)
                        .overlay(
                            Rectangle()
                                .fill(Color.customCyan.opacity(0.2))
                                .frame(width: 1)
                                .padding(.leading, 12),
                            alignment: .leading
                        )
                    }

                    // Distribution
                    if let mapImage = species.mapImageUrl {
                        VStack(alignment: .leading, spacing: 16) {
                            HStack {
                                Text("地理分布")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.white)
                                Spacer()
                                Image(systemName: "globe.americas.fill")
                                    .foregroundColor(Color.customCyan)
                            }

                            AsyncImage(url: URL(string: mapImage)) { image in
                                image.resizable().aspectRatio(contentMode: .fill)
                            } placeholder: {
                                Color.gray.opacity(0.3)
                            }
                            .frame(height: 180)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray.opacity(0.2), lineWidth: 1))
                            .grayscale(0.5)

                            Text(species.distribution ?? "")
                                .font(.system(size: 14, weight: .regular))
                                .foregroundColor(Color(hex: "bbc9cc"))
                        }
                        .padding(24)
                        .background(Color(hex: "1e2023"))
                        .cornerRadius(24)
                    }
                }
                .padding(24)
                .offset(y: -40)
            }
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
}

// Helpers
struct StatBox: View {
    let icon: String
    let title: String
    let value: String

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(Color.customCyan)

            VStack(alignment: .leading, spacing: 4) {
                Text(title.uppercased())
                    .font(.system(size: 10, weight: .regular, design: .monospaced))
                    .foregroundColor(Color(hex: "bbc9cc"))

                Text(value)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(hex: "1a1c1f"))
        .cornerRadius(12)
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray.opacity(0.1), lineWidth: 1))
    }
}

struct TaxonomyLine: View {
    let level: String
    let value: String

    var body: some View {
        HStack {
            Rectangle()
                .fill(Color.customCyan.opacity(0.4))
                .frame(width: 16, height: 1)
                .offset(x: -20)

            VStack(alignment: .leading, spacing: 2) {
                Text(level.uppercased())
                    .font(.system(size: 10, weight: .bold, design: .monospaced))
                    .foregroundColor(Color.customCyan)

                Text(value)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.white)
            }
        }
    }
}
