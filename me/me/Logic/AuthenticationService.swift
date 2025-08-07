import Foundation
import FirebaseAuth
import GoogleSignIn
import AuthenticationServices

class AuthenticationService: ObservableObject {
    @Published var user: User?
    private var handle: AuthStateDidChangeListenerHandle?

    init() {
        handle = Auth.auth().addStateDidChangeListener { [weak self] (_, user) in
            self?.user = user
        }
    }

    deinit {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }

    func signInWithGoogle(tokens: GIDGoogleUser) {
        guard let idToken = tokens.idToken?.tokenString else {
            print("Google ID token not found.")
            return
        }

        let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                         accessToken: tokens.accessToken.tokenString)

        Auth.auth().signIn(with: credential) { (authResult, error) in
            if let error = error {
                print("Error signing in with Google: \(error.localizedDescription)")
                return
            }
            // User is signed in
        }
    }

    func signInWithApple(credential: ASAuthorizationAppleIDCredential) {
        guard let appleIDToken = credential.identityToken else {
            print("Apple ID token not found.")
            return
        }
        guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
            print("Unable to convert Apple ID token to string.")
            return
        }

        let credential = OAuthProvider.credential(withProviderID: "apple.com",
                                                  idToken: idTokenString,
                                                  rawNonce: nil) // TODO: Add nonce handling for security

        Auth.auth().signIn(with: credential) { (authResult, error) in
            if let error = error {
                print("Error signing in with Apple: \(error.localizedDescription)")
                return
            }
            // User is signed in
        }
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Error signing out: \(error.localizedDescription)")
        }
    }
}
