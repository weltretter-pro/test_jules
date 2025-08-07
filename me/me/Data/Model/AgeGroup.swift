enum AgeGroup: String, CaseIterable, Identifiable {
    case toddlers = "2-3 years"
    case preschoolers = "4-5 years"
    case earlyElementary = "6-8 years"
    case tweens = "9-12 years"
    case teens = "13-18 years"
    case youngAdults = "19-25 years"
    case adults = "26-45 years"
    
    var id: String { self.rawValue }
}
