import SwiftUI

struct EvolutionTimelineView: View {
    let onOpenSpecies: (Species) -> Void

    private let periods = MockData.evolutionTimelinePeriods

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 18) {
                Text("演化展览")
                    .font(.system(size: 32, weight: .black, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.top, 100)
                    .padding(.horizontal, 24)

                Text("按年代浏览关键谱系，查看物种如何在不同生态压力下形成今天的样貌。")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(Color.white.opacity(0.7))
                    .lineSpacing(4)
                    .padding(.horizontal, 24)

                VStack(spacing: 14) {
                    ForEach(periods) { period in
                        PeriodSection(period: period, onOpenSpecies: onOpenSpecies)
                    }
                }
                .padding(.horizontal, 24)

                Spacer().frame(height: 120)
            }
        }
        .background(Color.customBackground.ignoresSafeArea())
    }
}

private struct PeriodSection: View {
    let period: EvolutionTimelinePeriod
    let onOpenSpecies: (Species) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(period.title)
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(.white)

            Text(period.rangeLabel)
                .font(.system(size: 12, weight: .semibold, design: .monospaced))
                .foregroundColor(Color.customCyan)

            Text(period.highlight)
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(Color.white.opacity(0.7))
                .lineSpacing(4)

            VStack(spacing: 10) {
                ForEach(period.species) { species in
                    TimelineSpeciesCard(species: species)
                        .onTapGesture {
                            onOpenSpecies(species)
                        }
                }
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.customSurface)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.white.opacity(0.08), lineWidth: 1))
    }
}

private struct TimelineSpeciesCard: View {
    let species: Species

    var body: some View {
        HStack(spacing: 12) {
            AsyncImage(url: URL(string: species.imageUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .frame(width: 64, height: 64)
            .clipShape(RoundedRectangle(cornerRadius: 10))

            VStack(alignment: .leading, spacing: 6) {
                Text(species.name)
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.white)

                Text(species.scientificName)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(Color.customCyan)

                Text(species.status.rawValue)
                    .font(.system(size: 11, weight: .medium))
                    .foregroundColor(Color.white.opacity(0.65))
            }

            Spacer()

            Image(systemName: "arrow.up.right")
                .foregroundColor(Color.white.opacity(0.4))
        }
        .padding(12)
        .background(Color(hex: "25282d"))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .contentShape(Rectangle())
    }
}
