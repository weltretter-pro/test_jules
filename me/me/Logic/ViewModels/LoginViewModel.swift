import Foundation
import Combine
import AuthenticationServices
import GoogleSignIn

class LoginViewModel: ObservableObject {
    private let authService: AuthenticationService
    private var cancellables = Set<AnyCancellable>()

    init(authService: AuthenticationService) {
        self.authService = authService
    }

    func signInWithGoogle() {
        guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {
            print("Could not find presenting view controller.")
            return
        }

        GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController) { [weak self] signInResult, error in
            guard let self = self else { return }
            if let error = error {
                print("Error signing in with Google: \(error.localizedDescription)")
                return
            }
            guard let signInResult = signInResult else { return }
            self.authService.signInWithGoogle(tokens: signInResult.user)
        }
    }

    func signInWithApple() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]

        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = makeAuthorizationControllerDelegate()
        controller.performRequests()
    }

    private func makeAuthorizationControllerDelegate() -> AuthorizationControllerDelegate {
        let delegate = AuthorizationControllerDelegate { [weak self] credential in
            self?.authService.signInWithApple(credential: credential)
        }
        // Keep a strong reference to the delegate
        self.authorizationControllerDelegate = delegate
        return delegate
    }

    private var authorizationControllerDelegate: AuthorizationControllerDelegate?
}


class AuthorizationControllerDelegate: NSObject, ASAuthorizationControllerDelegate {
    private let onSignedIn: (ASAuthorizationAppleIDCredential) -> Void

    init(onSignedIn: @escaping (ASAuthorizationAppleIDCredential) -> Void) {
        self.onSignedIn = onSignedIn
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            onSignedIn(appleIDCredential)
        }
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("Apple Sign In failed with error: \(error.localizedDescription)")
    }
}
