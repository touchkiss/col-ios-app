import SwiftUI

struct SearchView: View {
    let onOpenSpecies: (Species) -> Void

    @State private var query = ""

    private var filteredSpecies: [Species] {
        MockData.searchSpecies(query: query)
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                HStack(spacing: 10) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color.customCyan)

                    TextField("搜索物种名称、学名或标签", text: $query)
                        .foregroundColor(.white)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)

                    if !query.isEmpty {
                        Button(action: { query = "" }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(Color.white.opacity(0.6))
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, 14)
                .padding(.vertical, 12)
                .background(Color.customSurface)
                .clipShape(RoundedRectangle(cornerRadius: 14))
                .overlay(RoundedRectangle(cornerRadius: 14).stroke(Color.white.opacity(0.08), lineWidth: 1))
                .padding(.top, 100)
                .padding(.horizontal, 24)

                if query.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    starterContent
                        .padding(.horizontal, 24)
                } else if filteredSpecies.isEmpty {
                    emptyState
                        .padding(.horizontal, 24)
                } else {
                    VStack(spacing: 14) {
                        ForEach(filteredSpecies) { species in
                            SearchResultRow(species: species)
                                .onTapGesture {
                                    onOpenSpecies(species)
                                }
                        }
                    }
                    .padding(.horizontal, 24)
                }

                Spacer().frame(height: 120)
            }
        }
        .background(Color.customBackground.ignoresSafeArea())
    }

    private var starterContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("探索建议")
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(.white)

            Text("输入关键字后将立即过滤本地物种数据，可按中文名、学名或标签快速定位。")
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(Color.white.opacity(0.7))
                .lineSpacing(4)

            HStack(spacing: 10) {
                ForEach(MockData.searchStarterKeywords, id: \.self) { keyword in
                    Button(action: { query = keyword }) {
                        Text(keyword)
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(Color.customCyan)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 8)
                            .background(Color.customSurface)
                            .clipShape(Capsule())
                    }
                    .buttonStyle(.plain)
                }
            }

            VStack(spacing: 12) {
                ForEach(MockData.searchPreviewSpecies) { species in
                    SearchResultRow(species: species)
                        .onTapGesture {
                            onOpenSpecies(species)
                        }
                }
            }
        }
    }

    private var emptyState: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("未找到匹配物种")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)

            Text("试试更短的关键字，或使用标签词如“濒危”“海洋”“活化石”。")
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(Color.white.opacity(0.7))
                .lineSpacing(4)

            Button(action: { query = "" }) {
                Text("清空搜索")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(Color.customCyan)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(Color.customSurface)
                    .clipShape(Capsule())
            }
            .buttonStyle(.plain)
        }
        .padding(18)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.customSurface)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.white.opacity(0.08), lineWidth: 1))
    }
}

private struct SearchResultRow: View {
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
            .frame(width: 70, height: 70)
            .clipShape(RoundedRectangle(cornerRadius: 12))

            VStack(alignment: .leading, spacing: 6) {
                Text(species.name)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)

                Text(species.scientificName)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(Color.customCyan)
                    .lineLimit(1)

                Text(species.tags.prefix(2).joined(separator: " · "))
                    .font(.system(size: 11, weight: .medium))
                    .foregroundColor(Color.white.opacity(0.6))
                    .lineLimit(1)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(Color.white.opacity(0.4))
        }
        .padding(12)
        .frame(maxWidth: .infinity)
        .background(Color.customSurface)
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .overlay(RoundedRectangle(cornerRadius: 14).stroke(Color.white.opacity(0.08), lineWidth: 1))
        .contentShape(Rectangle())
    }
}
