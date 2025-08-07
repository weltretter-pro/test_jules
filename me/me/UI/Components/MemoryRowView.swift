import SwiftUI

struct MemoryRowView: View {
    let memory: Memory
    
    var body: some View {
        HStack(spacing: 15) {
            VStack(alignment: .leading, spacing: 5) {
                Text(memory.date)
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text(memory.title)
                    .font(.headline)
                    .fontWeight(.bold)
                Text(memory.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Image(memory.imageName) // Placeholder
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .cornerRadius(10)
        }
        .padding(.horizontal)
    }
}
