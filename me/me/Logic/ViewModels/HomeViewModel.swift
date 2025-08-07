import Foundation

class HomeViewModel: ObservableObject {
    @Published var currentMission: Mission?
    @Published var selectedAgeGroup: AgeGroup = .earlyElementary {
        didSet {
            fetchNewMission()
        }
    }
    
    private let missionRepository = MissionRepository()
    
    init() {
        fetchNewMission()
    }
    
    func fetchNewMission() {
        currentMission = missionRepository.fetchMissions(for: selectedAgeGroup).randomElement()
    }
}
