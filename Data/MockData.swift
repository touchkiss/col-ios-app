import Foundation

struct EvolutionTimelinePeriod: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let rangeLabel: String
    let highlight: String
    let species: [Species]
}

struct MockData {

    // MARK: - User
    static let currentUser = User(
        name: "Luna Chen",
        title: "EX-04 BIOLOGIST",
        avatarUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuDZjfWEBsL5o3qAZBKZ3bBAucsl33EC3wQuotsyVnbeF2O1Q3UmhPdYQ_aYeTd3nSIIunDQ-lxBJKMaS7wIr7VmcYz2B_Yli6s1eyzcFqnqr6Q1kq2REpHCff1KtuTpMnwh4JkmUPJJJ1YM3AIHlGNDKljMjDtx4VeLWHbQ3Yb5hWi9hTlIktA3-B2r0vnOaNs4yzSi2OMgvFcnLgSwViC410HlQvJ7dSVYGys_ZApihE_XTZIPrWGMCCPrvv_BnvUrQoVve_qvVaE",
        isVerified: true,
        speciesViewed: 128,
        speciesSaved: 24,
        areasExplored: 9,
        contributionPoints: 2480,
        percentile: "Top 5%",
        nextLevelProgress: 0.85,
        currentLevel: 4,
        badges: [
            AchievementBadge(name: "森林护卫者", iconSystemName: "tree.fill", isUnlocked: true, colorHex: "94d3c1"),
            AchievementBadge(name: "初级观察员", iconSystemName: "magnifyingglass", isUnlocked: true, colorHex: "00bcd2"),
            AchievementBadge(name: "深海探索者", iconSystemName: "lock.fill", isUnlocked: false, colorHex: nil)
        ]
    )

    // MARK: - Species
    static let polarBear = Species(
        name: "北极熊",
        scientificName: "Ursus maritimus",
        description: "北极熊，是熊科熊属的一种动物，是世界上最大的陆地食肉动物，又名白熊。其皮肤为黑色，由于毛发透明故外观上通常为白色，也有黄色等颜色。身体大而粗壮，头宽、耳小、颈长。北极熊的视力和听力与人类相当，但嗅觉极为灵敏，能侦测到1公里以外冰层下密封的海豹。",
        imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuBdem1l2oFFn10QsLlCliQREDiSKoc3JnquuKw3f9V98A-TZfH-PXZwMbW88zEi8D6QOxwVr4s1RGKJZr5uA5ccj4ayt0BhNbBDHsRn8xHjmKYgdoDCfs6eOPj8wsEF2zo-BG5_6e4F13-u_nGaQ_BEfD4nS1WkAoNcETYUYASqN2N4qgjbLoE9P2tC8lfLNp2VyIR7Wlt3ZxVZ1Us8ALRIXTu6SwTxlmrUaa7eHS9AEbSyYaKz2oasXUMjK31p0Ywx8RApHFNZQ78",
        domain: "真核域 Eukaryota",
        kingdom: "动物界 Animalia",
        phylum: "脊索动物门 Chordata",
        className: "哺乳纲 Mammalia",
        order: "食肉目 Carnivora",
        family: "熊科 Ursidae",
        genus: "熊属 Ursus",
        status: .vulnerable,
        tags: ["极地生存大师", "今日推荐"],
        averageTemp: "-34°C",
        mass: "350-700kg",
        length: "2.4-3.0m",
        lifespan: "25-30 Years",
        mapImageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuB2do83PrNfSG3Fjru6PPTSW6MQ_NjcQBk5pAfQsxOFKdKLScByKBHXz8qtvSWVPizA0_5MykT76SZSbSAQvhc_a5BQnGoo50EL-ChkG27pYXoNyHxC9HWDniAr20G8SC8e_s6Zg2cO1CRhebQj_n9AYXlI9loOJ6BAa2UeG553Ju4B9-aA9BL95hzvuzWC7MJJzTZ0B642woe4LlHZoG4OqCifZ11IdyKnAQBWoHtUIFGn-lR8OLAlsXfXkekGLvcqLLwXKYwM0Do",
        distribution: "分布在北极圈及其周边的冰原上，主要集中在加拿大、俄罗斯、格陵兰岛及美国阿拉斯加州。",
        habitatIcon: "globe",
        habitatName: "Arctic Circle",
        depth: nil
    )

    static let axolotl = Species(
        name: "美西螈",
        scientificName: "Ambystoma mexicanum",
        description: "墨西哥钝口螈，又名美西螈，俗称六角恐龙，是水栖的两栖类，是墨西哥的特有种。由于其极高的再生能力，在科学研究中具有重要价值。",
        imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuC-FkInI-ZaScVk3rLmtg7tNevhH9ot8kQL5KXL2FrrrgbjJj3KTjTBWN0bYgN13SQsAPpZ8qE5PM4cxlv1kjlgTmdP1sei_XYRtud57F3AXfS10myKkgNgzL0n09C5GYnhtar-kSfkb2FkJExUpu9uB6FZPU8VERi2LvcMcStmY7XLAifIutUBgSoX1laL34d2CdquZjVzyEozsaXPXI3-sZmmOFosErQ_o8WTTKlLPRggLo-6wxJcs31fkGBCp_lMQkm0eyyBZBo",
        domain: "真核域 Eukaryota",
        kingdom: "动物界 Animalia",
        phylum: "脊索动物门 Chordata",
        className: "两栖纲 Amphibia",
        order: "有尾目 Urodela",
        family: "钝口螈科 Ambystomatidae",
        genus: "钝口螈属 Ambystoma",
        status: .critical,
        tags: ["再生奇迹"],
        averageTemp: "14-20°C",
        mass: "60-110g",
        length: "15-45cm",
        lifespan: "10-15 Years",
        mapImageUrl: nil,
        distribution: "仅分布于墨西哥中部的霍奇米尔科湖和查尔科湖。",
        habitatIcon: "drop.fill",
        habitatName: "墨西哥霍奇米尔科",
        depth: "Shallow Waters"
    )

    static let snowLeopard = Species(
        name: "雪豹",
        scientificName: "Panthera uncia",
        description: "雪豹，是一种大型猫科动物，常在雪线附近和雪地间活动。其皮毛为灰白色，有黑色点斑和黑环，尾巴长而粗大，是高山生态系统的旗舰物种。",
        imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuDuqadlhqXkEZLDXcGUcopmAotWGFPkCCJpcVjywCjk7kJLvcWsXWUSxdZ3V51W9IQi9rM6Sem_2KiGqtFnd-ap0efd_UJM0kx5UD9elzT8xhrGSdss4vrezpX6cjCiyFCY4kNJQkrrUmlKckL09PI-mEde68tgIZcnacnyvKaS8dmvqtvVdCcjNqKkWtSXCh9qBz8krL7K4dXieZg4AbgWXoRvnGck-SvTYmSk3nKWDswfptkwVuVmdjFu9wxeBMdWtab1yFYnr4M",
        domain: "真核域 Eukaryota",
        kingdom: "动物界 Animalia",
        phylum: "脊索动物门 Chordata",
        className: "哺乳纲 Mammalia",
        order: "食肉目 Carnivora",
        family: "猫科 Felidae",
        genus: "豹属 Panthera",
        status: .vulnerable,
        tags: ["雪山之王"],
        averageTemp: "-20-10°C",
        mass: "22-55kg",
        length: "0.9-1.3m",
        lifespan: "15-18 Years",
        mapImageUrl: nil,
        distribution: "主要分布于中亚和南亚的崎岖山区，包括喜马拉雅山脉和青藏高原。",
        habitatIcon: "mountain.2.fill",
        habitatName: "中亚高山地区",
        depth: nil
    )

    // Placeholder data for other requested species to meet requirements
    static let blueWhale = Species(
        name: "蓝鲸", scientificName: "Balaenoptera musculus", description: "地球上现存体积最大的动物。", imageUrl: "https://picsum.photos/seed/bluewhale/800/1200",
        domain: "Eukaryota", kingdom: "Animalia", phylum: "Chordata", className: "Mammalia", order: "Cetacea", family: "Balaenopteridae", genus: "Balaenoptera",
        status: .endangered, tags: ["海洋巨霸"], averageTemp: nil, mass: "150t", length: "24m", lifespan: "80-90 Years", mapImageUrl: nil, distribution: "全球各大洋", habitatIcon: "water.waves", habitatName: "深海", depth: "100-500m"
    )

    static let ginkgo = Species(
        name: "银杏", scientificName: "Ginkgo biloba", description: "现存最古老的树种之一，被誉为植物界的活化石。", imageUrl: "https://picsum.photos/seed/ginkgo/800/1200",
        domain: "Eukaryota", kingdom: "Plantae", phylum: "Ginkgophyta", className: "Ginkgoopsida", order: "Ginkgoales", family: "Ginkgoaceae", genus: "Ginkgo",
        status: .endangered, tags: ["活化石"], averageTemp: nil, mass: nil, length: "40m", lifespan: "1000+ Years", mapImageUrl: nil, distribution: "全球温带地区", habitatIcon: "leaf.fill", habitatName: "温带落叶林", depth: nil
    )

    static let mantisShrimp = Species(
        name: "雀尾螳螂虾", scientificName: "Odontodactylus scyllarus", description: "拥有极其复杂的视觉系统和极快的前肢击打速度。", imageUrl: "https://picsum.photos/seed/mantis/800/1200",
        domain: "Eukaryota", kingdom: "Animalia", phylum: "Arthropoda", className: "Malacostraca", order: "Stomatopoda", family: "Odontodactylidae", genus: "Odontodactylus",
        status: .leastConcern, tags: ["视觉刺客"], averageTemp: nil, mass: nil, length: "18cm", lifespan: "3-5 Years", mapImageUrl: nil, distribution: "印度洋-太平洋浅海", habitatIcon: "water.waves", habitatName: "热带珊瑚礁", depth: "10-30m"
    )

    static let giantSequoia = Species(
        name: "巨杉", scientificName: "Sequoiadendron giganteum", description: "世界上体积最大的树。", imageUrl: "https://picsum.photos/seed/sequoia/800/1200",
        domain: "Eukaryota", kingdom: "Plantae", phylum: "Pinophyta", className: "Pinopsida", order: "Pinales", family: "Cupressaceae", genus: "Sequoiadendron",
        status: .endangered, tags: ["森林巨柱"], averageTemp: nil, mass: nil, length: "85m", lifespan: "3000+ Years", mapImageUrl: nil, distribution: "美国加利福尼亚州内华达山脉", habitatIcon: "tree.fill", habitatName: "高海拔针叶林", depth: nil
    )

    static let emperorPenguin = Species(
        name: "帝企鹅", scientificName: "Aptenodytes forsteri", description: "体型最大的企鹅，能在南极严寒中繁殖。", imageUrl: "https://picsum.photos/seed/penguin/800/1200",
        domain: "Eukaryota", kingdom: "Animalia", phylum: "Chordata", className: "Aves", order: "Sphenisciformes", family: "Spheniscidae", genus: "Aptenodytes",
        status: .nearThreatened, tags: ["冰雪皇族"], averageTemp: "-40°C", mass: "22-45kg", length: "1.1-1.3m", lifespan: "20 Years", mapImageUrl: nil, distribution: "南极洲大陆边缘", habitatIcon: "snowflake", habitatName: "南极冰原", depth: "0-500m"
    )

    static let allSpecies = [polarBear, axolotl, snowLeopard, blueWhale, ginkgo, mantisShrimp, giantSequoia, emperorPenguin]
    static let favorites = [axolotl, snowLeopard]
    static let recommended = [polarBear, emperorPenguin]

    static let searchStarterKeywords = ["极地", "海洋", "活化石", "濒危", "两栖"]
    static let searchPreviewSpecies = [polarBear, ginkgo, blueWhale]

    static let evolutionTimelinePeriods: [EvolutionTimelinePeriod] = [
        EvolutionTimelinePeriod(
            title: "寒武纪生命爆发",
            rangeLabel: "约 5.41 亿年前",
            highlight: "多细胞复杂生命快速出现",
            species: [mantisShrimp]
        ),
        EvolutionTimelinePeriod(
            title: "中生代与古老谱系延续",
            rangeLabel: "约 2.52 亿 - 6600 万年前",
            highlight: "古老植物和海洋支系延续至今",
            species: [ginkgo]
        ),
        EvolutionTimelinePeriod(
            title: "新生代哺乳动物扩张",
            rangeLabel: "约 6600 万年前至今",
            highlight: "大型哺乳动物在多样生态位中演化",
            species: [polarBear, snowLeopard, blueWhale]
        ),
        EvolutionTimelinePeriod(
            title: "第四纪极端环境适应",
            rangeLabel: "约 258 万年前至今",
            highlight: "寒区与高海拔适应形态进一步强化",
            species: [emperorPenguin, axolotl]
        )
    ]

    static func searchSpecies(query: String) -> [Species] {
        let normalized = query.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !normalized.isEmpty else { return [] }

        return allSpecies.filter { species in
            species.name.localizedCaseInsensitiveContains(normalized)
            || species.scientificName.localizedCaseInsensitiveContains(normalized)
            || species.tags.contains(where: { $0.localizedCaseInsensitiveContains(normalized) })
        }
    }

    // MARK: - Taxonomy Explorer Mock
    static let taxonomyTree = TaxonomyNode(
        level: .domain,
        name: "真核域",
        scientificName: "Eukaryota",
        description: "5.4M 已描述物种",
        iconName: "network",
        imageUrl: nil,
        children: [
            TaxonomyNode(
                level: .kingdom,
                name: "动物界",
                scientificName: "Animalia",
                description: "脊椎 & 无脊椎",
                iconName: "hare.fill",
                imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuCN0LL2t_xKeiBxEVxRCy217FV7X19BaDjzKFBE4SeIZJzz2zyMaWf1x27GkVfU1vMllx_OiAFF96UVqMW2lX_SeibtLG-z65zj9I5dzDsHdE7mWRY_ebp73C8xgEbLV1B5flFCFpK8W_-7Q3DHNXrJowaqCKhbbQBQGsOAvznpAGu5-d26oTddaJK18VgdQR7lACZVIObsZCElSZq497GI1dLPHYQ4wUbx0yYy4RZM4gLtJNk2vQePjUvXMJXpx_uDLko285Ao7pc",
                children: [
                    TaxonomyNode(
                        level: .phylum,
                        name: "脊索动物门",
                        scientificName: "Chordata",
                        description: "包含脊椎动物",
                        iconName: "water.waves",
                        imageUrl: nil,
                        children: [
                            TaxonomyNode(
                                level: .className,
                                name: "哺乳纲",
                                scientificName: "Mammalia",
                                description: "温血动物",
                                iconName: "pawprint.fill",
                                imageUrl: nil,
                                speciesCount: "6,400+ 种"
                            )
                        ]
                    )
                ],
                speciesCount: "1.5M+"
            ),
            TaxonomyNode(
                level: .kingdom,
                name: "植物界",
                scientificName: "Plantae",
                description: "被子 & 裸子",
                iconName: "leaf.fill",
                imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuAVJ1SKTvQUjD682f607ix65qaIkff79WM1Gi3UFf-7M7kM8zPzxi2tQ3qvETUt5igAIHNpqLs3S2XqDViWmfKzx4zcrr0LEq8RhFxL2rbkkkKFWQlVMqLvXDJpggP790qDi7zuOe4wx1HkFpE_-5NFOOFkMQGzHAMQWu-lT7Q6HQkLYWWTff-jXOHeZoSg58Z9pxC-KQKJc-ZCsUfJZxabYOgW6GPFm7EnCB5vxrzSAlblan5D06tqG5FaUNa9ii02AqCx3drBb3o"
            )
        ]
    )
}
