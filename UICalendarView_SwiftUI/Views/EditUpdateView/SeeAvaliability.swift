import SwiftUI
import SwiftData
struct SeeAvaliability: View {
    @State private var newGroup = false
    @Query var aGroup: [Grouping]
    @Environment(\.modelContext) var modelContext
    var body: some View {
        ZStack {
            Color("GroupSyncLightGreen")
                .ignoresSafeArea()
            VStack {
               
                Button {
                    withAnimation {
                        self.newGroup = true
                    }
                } label: {
                    Text(" + Add New Group")
                        .font(.title)
                }
                
                List {
                    ForEach (aGroup) { group in
                        // Text(group.title)
                        NavigationLink(destination: AvailableTimePage()) {
                            Text(group.title)
                        }
                    }
                    .onDelete(perform: deleteGroup)
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                .cornerRadius(10)
                .padding()
                

            }
        }
        
        if newGroup {
            AddGroup(group: Grouping(title: ""), newGroup: $newGroup)
        }
            
        }
    func deleteGroup(at offsets: IndexSet) {
        for offset in offsets {
            let group = aGroup[offset]
            modelContext.delete(group)
        }
    }
    }


#Preview {
    SeeAvaliability()
}
