import SwiftUI

struct TaxonomyDetailView: View {
    let node: TaxonomyNode
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 32) {
                // Header Hero
                ZStack(alignment: .bottomLeading) {
                    if let image = node.imageUrl {
                        AsyncImage(url: URL(string: image)) { image in
                            image.resizable().aspectRatio(contentMode: .fill)
                        } placeholder: {
                            Color.gray.opacity(0.3)
                        }
                        .frame(height: 300)
                        .clipped()
                    } else {
                        Rectangle()
                            .fill(Color(hex: "1a1c1f"))
                            .frame(height: 300)
                    }

                    LinearGradient(
                        gradient: Gradient(colors: [.black.opacity(0.8), .clear]),
                        startPoint: .bottom,
                        endPoint: .top
                    )

                    VStack(alignment: .leading, spacing: 8) {
                        Text(node.level.localizedName.uppercased())
                            .font(.system(size: 10, weight: .bold, design: .monospaced))
                            .foregroundColor(Color.customCyan)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.customCyan.opacity(0.2))
                            .cornerRadius(4)

                        Text(node.name)
                            .font(.system(size: 48, weight: .heavy))
                            .foregroundColor(.white)

                        Text(node.scientificName)
                            .font(.system(size: 20, weight: .regular))
                            .foregroundColor(Color.customCyan)
                            .italic()
                    }
                    .padding(24)
                }

                // Description and Count
                VStack(alignment: .leading, spacing: 16) {
                    HStack(spacing: 12) {
                        Image(systemName: "number.circle.fill")
                            .font(.system(size: 24))
                            .foregroundColor(Color.customCyan)
                        Text(node.speciesCount ?? node.description)
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                    }

                    Text("该类群包含了生命演化史上的重要节点，其适应性和分布范围极其广泛。")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(Color.gray)
                        .lineSpacing(4)
                }
                .padding(.horizontal, 24)

                // Representative Species Grid
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text("代表物种")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                        Spacer()
                        Text("全部")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(Color.customCyan)
                    }
                    .padding(.horizontal, 24)

                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)], spacing: 16) {
                        // Demo grid mapping to all species mock
                        ForEach(MockData.allSpecies.prefix(4), id: \.id) { species in
                            SpeciesCardView(species: species, style: .bento)
                                .frame(height: 240)
                        }
                    }
                    .padding(.horizontal, 24)
                }

                Spacer().frame(height: 40)
            }
        }
        .background(Color.customBackground.ignoresSafeArea())
        .edgesIgnoringSafeArea(.top)
        .overlay(
            LiquidGlassNavigationBar(title: node.name, showBackButton: true, action: {
                presentationMode.wrappedValue.dismiss()
            }),
            alignment: .top
        )
    }
}
