import SwiftUI
import SwiftData
struct AddGroup: View {
    @Bindable var group: Grouping
    @Environment(\.modelContext) var modelContext
    @Binding var newGroup: Bool

    var body: some View {
            VStack {
                TextField("Enter the task description...", text: $group.title, axis: .vertical)
                    .padding()
                    .background(Color(.systemGroupedBackground))
                    .cornerRadius(15)
                Text("Group Name")
                    .font(.title3)
                    .padding()
                Button {
                    additionalGroup()
                    withAnimation {
                        self.newGroup = false
                    }
                } label: {
                    Text("Save")
                        .font(.title3)
                  
                }
            }
        
        .padding()
    }
    
    func additionalGroup() {
        let AGroup = Grouping(title: group.title)
        modelContext.insert(AGroup)
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Grouping.self, configurations: config)

    let AGroup = Grouping(title: "Example ToDo")
    return AddGroup(group: AGroup, newGroup: .constant(true))
        .modelContainer(container)
}
