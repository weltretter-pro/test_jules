import Foundation
struct Mission: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let description: String
    let imageName: String
    let ageGroup: AgeGroup
}
