//
//  meApp.swift
//  me
//
//  Created by App Team 0 on 06/08/25.
//

import SwiftUI

@main
struct meApp: App {
    // In a real app, these would be managed by a service in the Logic layer.
    @State private var hasCompletedOnboarding = false
    @State private var isUserAuthenticated = false

        var body: some Scene {
            WindowGroup {
                // State-driven view logic to determine the initial screen.
                if !hasCompletedOnboarding {
                    OnboardingView(hasCompletedOnboarding: $hasCompletedOnboarding)
                } else if !isUserAuthenticated {
                    LoginView(isUserAuthenticated: $isUserAuthenticated)
                } else {
                    MainTabView()
                }
            }
        }
}
