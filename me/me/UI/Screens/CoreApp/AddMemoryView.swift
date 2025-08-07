import SwiftUI

struct AddMemoryView: View {
    @State private var note: String = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Mission Accomplished!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Capture this special moment with a photo and a note.")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                
                // Add Photo Section
                VStack {
                    Text("Add Photo")
                        .font(.headline)
                    Text("Tap to upload a photo from your gallery")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Button("Upload Photo") {}
                        .tint(.orange)
                        .buttonStyle(.bordered)
                        .padding(.top, 5)
                }
                .frame(maxWidth: .infinity)
                .padding(40)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(style: StrokeStyle(lineWidth: 2, dash: [8]))
                        .foregroundColor(Color(.systemGray4))
                )
                
                // Note Section
                TextField("Write a note about this memory", text: $note, axis: .vertical)
                    .padding()
                    .frame(height: 150, alignment: .top)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(15)

                PrimaryButton(title: "Save to Memory Timeline", action: {})
            }
            .padding()
        }
        .navigationTitle("Add to Memory")
        .navigationBarTitleDisplayMode(.inline)
    }
}
