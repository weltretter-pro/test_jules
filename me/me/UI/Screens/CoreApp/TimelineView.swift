import SwiftUI

struct TimelineView: View {
    // This data would come from a ViewModel.
    let memories = [
        Memory(title: "Nature Walk", date: "May 20, 2024", description: "We explored the local park, collecting leaves and identifying different types of trees.", imageName: "nature_walk"),
        Memory(title: "Baking Cookies", date: "May 13, 2024", description: "We baked chocolate chip cookies, measuring ingredients and decorating the finished treats.", imageName: "baking_cookies"),
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 30) {
                    Text("2024")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    ForEach(memories) { memory in
                        MemoryRowView(memory: memory)
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("Memories")
        }
    }
}
