import SwiftUI

struct TaxonomyExplorerView: View {
    @State private var searchText = ""
    @State private var selectedTab = 0
    let tree = MockData.taxonomyTree

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {

                // Search & Control Header
                VStack(alignment: .leading, spacing: 16) {
                    Text("探索分类")
                        .font(.system(size: 36, weight: .heavy))
                        .foregroundColor(.white)

                    Text("Digital Taxonomy Explorer v2.4".uppercased())
                        .font(.system(size: 14, weight: .bold, design: .monospaced))
                        .foregroundColor(.gray)
                        .tracking(2)

                    HStack {
                        Picker("", selection: $selectedTab) {
                            Text("分类树").tag(0)
                            Text("地图").tag(1)
                            Text("推荐").tag(2)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .background(Color(hex: "1a1c1f"))
                        .cornerRadius(8)
                    }
                    .padding(.top, 8)

                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("搜索物种、属或科...", text: $searchText)
                            .foregroundColor(.white)
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color(hex: "0c0e11"))
                    .cornerRadius(12)
                }
                .padding(.horizontal, 24)
                .padding(.top, 100) // NavBar spacer

                // Taxonomy Tree View
                VStack(alignment: .leading, spacing: 24) {
                    TaxonomyNodeView(node: tree, isExpanded: true)
                }
                .padding(.horizontal, 24)

                Spacer().frame(height: 120)
            }
        }
        .background(Color.customBackground.ignoresSafeArea())
    }
}

struct TaxonomyNodeView: View {
    let node: TaxonomyNode
    @State var isExpanded: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Node Header
            HStack(spacing: 16) {
                // Icon / Image
                if let image = node.imageUrl {
                    AsyncImage(url: URL(string: image)) { image in
                        image.resizable().aspectRatio(contentMode: .fill)
                    } placeholder: {
                        Color.gray.opacity(0.3)
                    }
                    .frame(width: 48, height: 48)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                } else {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.customCyan.opacity(0.1))
                            .frame(width: 48, height: 48)

                        Image(systemName: node.iconName ?? "leaf.fill")
                            .font(.system(size: 24))
                            .foregroundColor(Color.customCyan)
                    }
                }

                // Content
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(node.name)
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)

                        Text(node.scientificName)
                            .font(.system(size: 12, weight: .bold, design: .monospaced))
                            .foregroundColor(Color.customCyan.opacity(0.6))
                    }

                    Text(node.speciesCount ?? node.description)
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(.gray)
                }

                Spacer()

                if node.children != nil {
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(Color.customCyan)
                }
            }
            .padding()
            .background(Color(hex: isExpanded ? "282a2d" : "1e2023"))
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.customCyan.opacity(isExpanded ? 0.3 : 0), lineWidth: 1)
            )
            .onTapGesture {
                withAnimation {
                    isExpanded.toggle()
                }
            }

            // Children
            if isExpanded, let children = node.children {
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(children, id: \.id) { child in
                        HStack(alignment: .top) {
                            // Connecting Line
                            Rectangle()
                                .fill(Color.customCyan.opacity(0.3))
                                .frame(width: 20, height: 1)
                                .padding(.top, 24)

                            TaxonomyNodeView(node: child, isExpanded: false)
                        }
                    }
                }
                .padding(.leading, 24)
                .overlay(
                    Rectangle()
                        .fill(Color.customCyan.opacity(0.15))
                        .frame(width: 1)
                        .padding(.leading, 24),
                    alignment: .leading
                )
            }
        }
    }
}
