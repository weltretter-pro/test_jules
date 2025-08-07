import SwiftUI

struct LoginView: View {
    @Binding var isUserAuthenticated: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("Memory Missions")
                .font(.largeTitle).fontWeight(.bold)
            Text("Create lasting memories with your children through weekly activity suggestions.")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
            
            Spacer()
            
            PrimaryButton(title: "Sign Up", action: { isUserAuthenticated = true })
            SecondaryButton(title: "Log In", action: { isUserAuthenticated = true })
        }
        .padding(30)
    }
}
