import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @State private var isShowingSettings = false

    var body: some View {
        NavigationView {
            // 1. Use a ZStack to layer the FAB over the content.
            //    The `alignment` property positions non-expanding children like the button.
            ZStack(alignment: .bottomTrailing) {
                
                // --- Main Content ---
                ScrollView {
                    // 2. The main content is in this VStack.
                    //    Changing alignment to .center handles horizontal centering.
                    VStack(alignment: .center, spacing: 30) {
                        if let mission = viewModel.currentMission {
                            MissionCardView(mission: mission)

                            HStack(spacing: 15) {
                                PrimaryButton(title: "Accept Mission", action: {})
                                SecondaryButton(title: "Skip", action: {
                                    viewModel.fetchNewMission()
                                })
                            }
                        } else {
                            // Message shown when no missions are available.
                            Text("No missions available for this age group.")
                                .foregroundColor(.secondary)
                                .padding(.top, 50)
                        }
                    }
                    // Padding adds space around the entire content block.
                    .padding()
                }
                .navigationTitle("Home")
                .navigationBarItems(trailing: Button(action: {
                    isShowingSettings.toggle()
                }) {
                    Image(systemName: "gearshape.fill")
                        .font(.title2)
                        .foregroundColor(.primary)
                })

                // --- Floating Action Button (FAB) ---
                // 3. The FAB is now correctly positioned by the ZStack's alignment.
                Button(action: {
                    // Action for the FAB
                    print("FAB tapped")
                }) {
                    Image(systemName: "plus")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                        .frame(width: 60, height: 60)
                        .background(Color.accentColor)
                        .clipShape(Circle())
                        .shadow(color: .black.opacity(0.3), radius: 10, y: 5)
                }
                .padding()
            }
            .sheet(isPresented: $isShowingSettings) {
                SettingsView()
            }
        }
    }
}


