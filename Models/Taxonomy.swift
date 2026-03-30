import Foundation

struct TaxonomyNode: Identifiable {
    let id = UUID()
    let level: TaxonomyLevel
    let name: String
    let scientificName: String
    let description: String
    let iconName: String?
    let imageUrl: String?
    var children: [TaxonomyNode]?

    // Derived properties for UI
    var speciesCount: String?
}

enum TaxonomyLevel: String, CaseIterable {
    case domain = "Domain"
    case kingdom = "Kingdom"
    case phylum = "Phylum"
    case className = "Class"
    case order = "Order"
    case family = "Family"
    case genus = "Genus"
    case species = "Species"

    var localizedName: String {
        switch self {
        case .domain: return "域"
        case .kingdom: return "界"
        case .phylum: return "门"
        case .className: return "纲"
        case .order: return "目"
        case .family: return "科"
        case .genus: return "属"
        case .species: return "种"
        }
    }
}
