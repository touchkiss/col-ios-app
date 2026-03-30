import Foundation

struct User: Identifiable {
    let id = UUID()
    let name: String
    let title: String
    let avatarUrl: String
    let isVerified: Bool

    // Stats
    var speciesViewed: Int
    var speciesSaved: Int
    var areasExplored: Int

    // Progress
    var contributionPoints: Int
    var percentile: String
    var nextLevelProgress: Double // 0.0 to 1.0
    var currentLevel: Int

    // Badges
    var badges: [AchievementBadge]
}

struct AchievementBadge: Identifiable {
    let id = UUID()
    let name: String
    let iconSystemName: String
    let isUnlocked: Bool
    let colorHex: String?
}
