import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel: LoginViewModel

    init(authService: AuthenticationService) {
        _viewModel = StateObject(wrappedValue: LoginViewModel(authService: authService))
    }
    
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
            
            PrimaryButton(title: "Sign in with Apple", action: viewModel.signInWithApple)
            SecondaryButton(title: "Sign in with Google", action: viewModel.signInWithGoogle)
        }
        .padding(30)
    }
}
