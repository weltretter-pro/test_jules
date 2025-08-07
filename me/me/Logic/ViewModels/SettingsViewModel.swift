import Foundation
class SettingsViewModel: ObservableObject {
    @Published var areMissionRemindersOn = false
    @Published var areGeneralUpdatesOn = true
}
