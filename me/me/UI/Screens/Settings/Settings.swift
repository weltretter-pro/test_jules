import SwiftUI

struct SettingsView: View {
    @StateObject private var viewModel = SettingsViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Account")) {
                    Text("emma.hudson@example.com")
                    NavigationLink("Change Password", destination: Text("Change Password Screen"))
                }
                
                Section(header: Text("Notifications")) {
                    Toggle("Mission Reminders", isOn: $viewModel.areMissionRemindersOn)
                    Toggle("General Updates", isOn: $viewModel.areGeneralUpdatesOn)
                }
                
                Section(header: Text("Support")) {
                    NavigationLink("Help & FAQ", destination: Text("Help Screen"))
                }
                
                Button(action: {}) {
                    Text("Log Out")
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity)
                }
            }
            .navigationTitle("Settings")
        }
    }
}

