import Foundation

struct EvolutionTimelinePeriod: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let rangeLabel: String
    let highlight: String
    let species: [Species]
}
