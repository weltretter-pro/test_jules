struct MissionRepository {
    // In a real app, this data would be fetched from a database or API.
    // This is a sample of the 1000 missions.
    private let allMissions: [Mission] = [
        // Toddlers (2-3)
        Mission(title: "Bubble Chase", description: "Blow bubbles and let your toddler chase and pop them.", imageName: "bubbles", ageGroup: .toddlers),
        Mission(title: "Sensory Bin Fun", description: "Create a sensory bin with rice, water, or sand and various toys.", imageName: "sensory_bin", ageGroup: .toddlers),
        // ... 148 more for toddlers
        
        // Preschoolers (4-5)
        Mission(title: "Nature Scavenger Hunt", description: "Create a list of things to find in your backyard or a park (a green leaf, a smooth stone, etc.).", imageName: "scavenger_hunt", ageGroup: .preschoolers),
        Mission(title: "Build a Fort", description: "Use blankets, pillows, and chairs to build a cozy fort in the living room.", imageName: "fort_building", ageGroup: .preschoolers),
        // ... 148 more for preschoolers

        // Early Elementary (6-8)
        Mission(title: "DIY Pizza Night", description: "Let everyone make their own mini pizza with their favorite toppings.", imageName: "pizza_night", ageGroup: .earlyElementary),
        Mission(title: "Write a Story Together", description: "Take turns adding a sentence to create a silly or adventurous story.", imageName: "story_writing", ageGroup: .earlyElementary),
        // ... 148 more for early elementary

        // Tweens (9-12)
        Mission(title: "Learn a Magic Trick", description: "Find a simple magic trick online and practice it together until you can perform it.", imageName: "magic_trick", ageGroup: .tweens),
        Mission(title: "Code a Simple Game", description: "Use a platform like Scratch or Code.org to create a simple game together.", imageName: "coding_game", ageGroup: .tweens),
        // ... 148 more for tweens

        // Teens (13-18)
        Mission(title: "Cook a Meal for the Family", description: "Plan and cook a complete dinner for the family.", imageName: "family_dinner", ageGroup: .teens),
        Mission(title: "Volunteer Together", description: "Find a local charity or organization and spend a day volunteering.", imageName: "volunteering", ageGroup: .teens),
        // ... 148 more for teens

        // Young Adults (19-25)
        Mission(title: "Plan a Weekend Trip", description: "Research and plan a short weekend getaway, even if you don't go right away.", imageName: "weekend_trip", ageGroup: .youngAdults),
        Mission(title: "Learn a New Skill", description: "Take an online course or watch tutorials to learn a new skill together (e.g., photography, a new language).", imageName: "new_skill", ageGroup: .youngAdults),
        // ... 148 more for young adults

        // Adults (26-45)
        Mission(title: "Host a Dinner Party", description: "Invite friends over for a dinner party that you plan and cook together.", imageName: "dinner_party", ageGroup: .adults),
        Mission(title: "Create a Budget", description: "Work together to create a monthly or yearly budget and financial plan.", imageName: "budgeting", ageGroup: .adults),
        // ... 150 more for adults
    ]
    
    func fetchMissions(for ageGroup: AgeGroup) -> [Mission] {
        allMissions.filter { $0.ageGroup == ageGroup }
    }
}
