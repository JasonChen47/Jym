/*
 See LICENSE folder for this sample’s licensing information.
 */

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
    @State var scrum1 = DailyScrum.emptyScrum
//    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewScrumView = false
//    let saveAction: ()->Void

    var body: some View {
        NavigationStack {
            
//            List($scrums) { $scrum in
//                NavigationLink(destination: DetailView(scrum: $scrum)) {
//                    CardView(scrum: scrum)
//                }
//                .listRowBackground(scrum.theme.mainColor)
//            }
            List {
//                Section(header: Text("Recommended Next Workout")) {
//                    NavigationLink(destination: DetailView(scrum: $scrum1)) {
//                        Text("scrum1")
//                    }
//                }
                Section(header: Text("Recommended Next Workout")) {
                    ForEach($scrums) { $scrum in
//                        NavigationLink(destination: TestView7(scrum: $scrum)) {
                        NavigationLink(destination: NothingView()) {
//                            CardView(scrum: scrum)
                            Text(scrum.title)
                        }
//                        .listRowBackground(scrum.theme.mainColor)
                    }
                    .onDelete { scrums.remove(atOffsets: $0) }
                }
            }
            .navigationTitle("Daily Scrums")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: {
                        isPresentingNewScrumView = true
                    }) {
                        Image(systemName: "plus")
                    }
                    .accessibilityLabel("New Scrum")
                }
                
            }
        }
        .sheet(isPresented: $isPresentingNewScrumView) {
//            NewScrumSheet(scrums: $scrums, isPresentingNewScrumView: $isPresentingNewScrumView)
            NothingView()
        }
//        .onChange(of: scenePhase) { phase in
//            if phase == .inactive { saveAction() }
//        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(scrums: .constant(DailyScrum.sampleData))
    }
}
