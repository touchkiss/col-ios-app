import Foundation

struct Species: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let scientificName: String
    let description: String
    let imageUrl: String

    // Taxonomy
    let domain: String
    let kingdom: String
    let phylum: String
    let className: String
    let order: String
    let family: String
    let genus: String

    // Attributes
    let status: ConservationStatus
    let tags: [String]

    // Stats
    let averageTemp: String?
    let mass: String?
    let length: String?
    let lifespan: String?

    // Geography
    let mapImageUrl: String?
    let distribution: String?
    let habitatIcon: String?
    let habitatName: String?
    let depth: String?
}

enum ConservationStatus: String, Hashable {
    case critical = "极危"
    case endangered = "濒危"
    case vulnerable = "易危"
    case nearThreatened = "近危"
    case leastConcern = "无危"

    var acronym: String {
        switch self {
        case .critical: return "CR"
        case .endangered: return "EN"
        case .vulnerable: return "VU"
        case .nearThreatened: return "NT"
        case .leastConcern: return "LC"
        }
    }
}
