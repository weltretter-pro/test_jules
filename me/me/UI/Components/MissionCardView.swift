import SwiftUI

struct MissionCardView: View {
    let mission: Mission
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(mission.imageName) // Placeholder
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .clipped()
            
            VStack(alignment: .leading, spacing: 8) {
                Text(mission.title)
                    .font(.title2)
                    .fontWeight(.bold)
                Text(mission.description)
                    .foregroundColor(.secondary)
            }
            .padding()
        }
        .background(Color(.secondarySystemBackground))
        .cornerRadius(15)
        .padding(.horizontal)
    }
}
