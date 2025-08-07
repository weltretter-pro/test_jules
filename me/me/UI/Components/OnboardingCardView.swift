import SwiftUI

struct OnboardingCardView: View {
    let step: OnboardingStep
    
    var body: some View {
        VStack(spacing: 30) {
            Image(step.imageName) // Placeholder
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 300)
            
            Text(step.title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            Text(step.description)
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            Spacer()
        }
        .padding(30)
    }
}
