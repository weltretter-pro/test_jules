import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Add your children")) {
                    TextField("Child's name", text: .constant(""))
                    TextField("Child's age", text: .constant(""))
                    Button(action: {}) {
                        HStack {
                            Image(systemName: "camera.fill")
                            Text("Add photo")
                        }
                    }
                }
            }
            .navigationTitle("My Family")
            .navigationBarItems(trailing: Button("Save", action: {}))
        }
    }
}
