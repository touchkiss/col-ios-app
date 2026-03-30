import SwiftUI

struct ProfileView: View {
    let user = MockData.currentUser

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 32) {
                // Profile Header
                HStack(alignment: .bottom, spacing: 24) {
                    ZStack(alignment: .bottomTrailing) {
                        AsyncImage(url: URL(string: user.avatarUrl)) { image in
                            image.resizable().aspectRatio(contentMode: .fill)
                        } placeholder: {
                            Color.gray.opacity(0.3)
                        }
                        .frame(width: 112, height: 112)
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                        .overlay(RoundedRectangle(cornerRadius: 24).stroke(Color(hex: "282a2d"), lineWidth: 4))
                        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)

                        if user.isVerified {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(Color.customBackground)
                                .background(Circle().fill(Color.customCyan).frame(width: 20, height: 20))
                                .offset(x: 8, y: 8)
                        }
                    }

                    VStack(alignment: .leading, spacing: 4) {
                        Text(user.name)
                            .font(.system(size: 36, weight: .heavy))
                            .foregroundColor(.white)
                            .tracking(-1)

                        Text(user.title.uppercased())
                            .font(.system(size: 14, weight: .bold, design: .monospaced))
                            .foregroundColor(Color.customCyan)
                            .tracking(2)
                    }
                    .padding(.bottom, 8)
                }
                .padding(.horizontal, 24)
                .padding(.top, 100) // NavBar spacer

                // Stats
                HStack(spacing: 12) {
                    ProfileStatBox(value: "\(user.speciesViewed)", label: "已查看物种")
                    ProfileStatBox(value: "\(user.speciesSaved)", label: "已收藏")
                    ProfileStatBox(value: "\(user.areasExplored)", label: "已探索区域")
                }
                .padding(.horizontal, 24)

                // Achievement Badges
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text("成就勋章")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                        Spacer()
                        Text("查看全部")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(Color.customCyan)
                    }
                    .padding(.horizontal, 24)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(user.badges) { badge in
                                BadgeView(badge: badge)
                            }
                        }
                        .padding(.horizontal, 24)
                    }
                }

                // Contribution Progress
                VStack(alignment: .leading, spacing: 16) {
                    Text("贡献进度")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.horizontal, 24)

                    VStack(alignment: .leading, spacing: 24) {
                        HStack(alignment: .top) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("本月贡献点")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(Color(hex: "bbc9cc"))
                                Text("\(user.contributionPoints)")
                                    .font(.system(size: 36, weight: .black))
                                    .foregroundColor(Color.customCyan)
                            }
                            Spacer()
                            Text(user.percentile.uppercased())
                                .font(.system(size: 10, weight: .bold, design: .monospaced))
                                .foregroundColor(Color.customCyan)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 4)
                                .background(Color.customCyan.opacity(0.2))
                                .cornerRadius(12)
                        }

                        VStack(spacing: 8) {
                            HStack {
                                Text("距离下一等级 (Lv.\(user.currentLevel + 1))")
                                    .font(.system(size: 12, weight: .regular))
                                    .foregroundColor(Color(hex: "bbc9cc"))
                                Spacer()
                                Text("\(Int(user.nextLevelProgress * 100))%")
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundColor(.white)
                            }

                            GeometryReader { geometry in
                                ZStack(alignment: .leading) {
                                    Capsule()
                                        .fill(Color(hex: "0c0e11"))
                                        .frame(height: 6)
                                    Capsule()
                                        .fill(LinearGradient(gradient: Gradient(colors: [Color.customCyan, Color(hex: "00bcd2")]), startPoint: .leading, endPoint: .trailing))
                                        .frame(width: geometry.size.width * CGFloat(user.nextLevelProgress), height: 6)
                                }
                            }
                            .frame(height: 6)
                        }
                    }
                    .padding(24)
                    .background(Color(hex: "282a2d"))
                    .cornerRadius(16)
                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray.opacity(0.1), lineWidth: 1))
                    .padding(.horizontal, 24)
                }

                // Settings List
                VStack(alignment: .leading, spacing: 16) {
                    Text("设置")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.horizontal, 24)

                    VStack(spacing: 0) {
                        SettingsRow(icon: "paintpalette", title: "主题", value: "深色")
                        Divider().background(Color.gray.opacity(0.2)).padding(.horizontal, 24)
                        SettingsRow(icon: "globe", title: "语言", value: "简体中文")
                        Divider().background(Color.gray.opacity(0.2)).padding(.horizontal, 24)
                        SettingsRow(icon: "icloud.and.arrow.down", title: "离线库", value: "1.2 GB")
                        Divider().background(Color.gray.opacity(0.2)).padding(.horizontal, 24)
                        SettingsRow(icon: "person.crop.circle", title: "账户", value: "")
                    }
                    .background(Color(hex: "1a1c1f"))
                    .cornerRadius(16)
                    .padding(.horizontal, 24)
                }

                // Logout Button
                Button(action: {}) {
                    Text("退出登录")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(Color(hex: "ffb4ab"))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(Color(hex: "93000a").opacity(0.2))
                        .cornerRadius(16)
                }
                .padding(.horizontal, 24)
                .padding(.top, 16)

                Spacer().frame(height: 120)
            }
        }
        .background(Color.customBackground.ignoresSafeArea())
    }
}

// Subviews
struct ProfileStatBox: View {
    let value: String
    let label: String

    var body: some View {
        VStack(spacing: 4) {
            Text(value)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)
            Text(label)
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(Color(hex: "bbc9cc"))
                .textCase(.uppercase)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(Color(hex: "1a1c1f"))
        .cornerRadius(16)
    }
}

struct BadgeView: View {
    let badge: AchievementBadge

    var body: some View {
        VStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(badge.isUnlocked ? (badge.colorHex != nil ? Color(hex: badge.colorHex!).opacity(0.2) : Color.gray.opacity(0.2)) : Color(hex: "333538"))
                    .frame(width: 64, height: 64)

                Image(systemName: badge.iconSystemName)
                    .font(.system(size: 28))
                    .foregroundColor(badge.isUnlocked ? (badge.colorHex != nil ? Color(hex: badge.colorHex!) : Color.white) : Color.gray)
            }
            .overlay(Circle().stroke(Color.gray.opacity(0.1), lineWidth: 1))

            Text(badge.name)
                .font(.system(size: 11, weight: .bold))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
        .frame(width: 140, height: 140)
        .background(Color(hex: "1e2023"))
        .cornerRadius(16)
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray.opacity(0.1), lineWidth: 1))
        .opacity(badge.isUnlocked ? 1.0 : 0.5)
        .grayscale(badge.isUnlocked ? 0 : 1)
    }
}

struct SettingsRow: View {
    let icon: String
    let title: String
    let value: String

    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(Color(hex: "bbc9cc"))

            Text(title)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)

            Spacer()

            if !value.isEmpty {
                Text(value)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(Color(hex: "bbc9cc"))
            }

            Image(systemName: "chevron.right")
                .font(.system(size: 14))
                .foregroundColor(Color(hex: "bbc9cc"))
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 16)
    }
}
