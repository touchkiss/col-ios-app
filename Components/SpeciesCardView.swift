import SwiftUI

struct SpeciesCardView: View {
    let species: Species
    var style: CardStyle = .bento
    var animationNamespace: Namespace.ID? = nil
    var animationID: AnyHashable? = nil

    enum CardStyle {
        case bento
        case hero
        case horizontal
    }

    @ViewBuilder
    private func cardSurface(proxy: GeometryProxy) -> some View {
        ZStack(alignment: .bottomLeading) {
            // Background Image
            AsyncImage(url: URL(string: species.imageUrl)) { image in
                image.resizable()
                     .aspectRatio(contentMode: .fill)
            } placeholder: {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
            }
            .frame(width: proxy.size.width, height: proxy.size.height)
            .clipped()

            // Gradient Overlay
            LinearGradient(
                gradient: Gradient(colors: [.black.opacity(0.8), .black.opacity(0.2), .clear]),
                startPoint: .bottom,
                endPoint: .top
            )

            // Content Overlay
            VStack(alignment: .leading, spacing: 4) {
                if let tag = species.tags.first {
                    Text(tag.uppercased())
                        .font(.system(size: 10, weight: .bold, design: .monospaced))
                        .foregroundColor(Color(hex: "00daf3"))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color(hex: "00daf3").opacity(0.2))
                        .cornerRadius(4)
                        .padding(.bottom, 2)
                }

                Text(species.name)
                    .font(.system(size: style == .hero ? 36 : 24, weight: .heavy))
                    .foregroundColor(.white)

                Text(species.scientificName)
                    .font(.system(size: style == .hero ? 18 : 12, weight: .regular))
                    .foregroundColor(.white.opacity(0.8))
                    .italic()
            }
            .padding(style == .hero ? 32 : 16)
        }
    }

    var body: some View {
        GeometryReader { proxy in
            if let animationNamespace, let animationID {
                cardSurface(proxy: proxy)
                    .matchedGeometryEffect(id: animationID, in: animationNamespace)
            } else {
                cardSurface(proxy: proxy)
            }
        }
        .background(Color.customSurface)
        .cornerRadius(style == .hero ? 24 : 16)
        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}
