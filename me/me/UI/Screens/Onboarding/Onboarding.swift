import SwiftUI

struct OnboardingView: View {
    @Binding var hasCompletedOnboarding: Bool
    @State private var currentStep = 0
    
    // This data could be fetched from a ViewModel in the Logic layer.
    let onboardingSteps = [
        OnboardingStep(imageName: "family_welcome", title: "Welcome to Memory Missions", description: "Create lasting memories with your children through fun, weekly activities."),
        OnboardingStep(imageName: "weekly_missions", title: "Weekly Missions", description: "Short, simple, family-focused activity suggestions every week, tailored by child's age."),
        OnboardingStep(imageName: "complete_capture", title: "Complete & Capture", description: "Once you've completed the mission, mark it as done. You'll be prompted to add a photo and a short note about your experience."),
        OnboardingStep(imageName: "memories_timeline", title: "Memories", description: "Build a beautiful timeline of your family's adventures to look back on for years to come."),
    ]
    
    var body: some View {
        VStack {
            TabView(selection: $currentStep) {
                ForEach(0..<onboardingSteps.count, id: \.self) { index in
                    OnboardingCardView(step: onboardingSteps[index]).tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            PrimaryButton(title: currentStep == onboardingSteps.count - 1 ? "Get Started" : "Next") {
                if currentStep == onboardingSteps.count - 1 {
                    hasCompletedOnboarding = true
                } else {
                    currentStep += 1
                }
            }
            .padding(20)
        }
        .animation(.default, value: currentStep)
    }
}
