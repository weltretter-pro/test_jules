//
//  meApp.swift
//  me
//
//  Created by App Team 0 on 06/08/25.
//

import SwiftUI
import Firebase

@main
struct meApp: App {
    // TODO: Please provide the actual GoogleService-Info.plist file
    @StateObject private var authService = AuthenticationService()
    @State private var hasCompletedOnboarding = false

    init() {
        FirebaseApp.configure()
    }

        var body: some Scene {
            WindowGroup {
                // State-driven view logic to determine the initial screen.
                if !hasCompletedOnboarding {
                    OnboardingView(hasCompletedOnboarding: $hasCompletedOnboarding)
                } else if authService.user == nil {
                    LoginView(authService: authService)
                } else {
                    MainTabView()
                        .environmentObject(authService)
                }
            }
        }
}
