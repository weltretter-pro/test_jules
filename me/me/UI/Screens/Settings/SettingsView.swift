import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var authService: AuthenticationService

    var body: some View {
        VStack {
            Spacer()
            PrimaryButton(title: "Sign Out", action: {
                authService.signOut()
            })
            .padding()
            Spacer()
        }
        .navigationTitle("Settings")
    }
}
