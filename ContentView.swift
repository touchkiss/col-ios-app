import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .home

    // We hide the default navigation bar and tab bar to implement our own "Liquid Glass" designs
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                // Main Content Area
                TabView(selection: $selectedTab) {
                    HomeView()
                        .tag(Tab.home)

                    TaxonomyExplorerView()
                        .tag(Tab.explore)

                    FavoritesView()
                        .tag(Tab.favorites)

                    ProfileView()
                        .tag(Tab.profile)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Allows swiping and hides default dots

                // Custom Navigation Header
                VStack {
                    LiquidGlassNavigationBar(title: getTitle(for: selectedTab))
                    Spacer()
                }
                .edgesIgnoringSafeArea(.top)

                // Custom Tab Bar
                LiquidGlassTabBar(selectedTab: $selectedTab)
            }
            .navigationBarHidden(true)
            .ignoresSafeArea(.keyboard, edges: .bottom) // Ensure keyboard doesn't push the tab bar weirdly
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    // Helper to get title based on current tab
    private func getTitle(for tab: Tab) -> String {
        switch tab {
        case .home: return "BioScope"
        case .explore: return "BioScope"
        case .favorites: return "BioScope"
        case .profile: return "BioScope"
        }
    }
}

// Global Extension for Navigation / UI testing
// You can use these structs locally to drop them into an Xcode project without errors.
