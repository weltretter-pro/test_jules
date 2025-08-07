import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var authService: AuthenticationService

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            TimelineView()
                .tabItem {
                    Label("Timeline", systemImage: "calendar")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }

            NavigationView {
                SettingsView()
            }
            .tabItem {
                Label("Settings", systemImage: "gear")
            }
        }
        .accentColor(.orange)
    }
}
