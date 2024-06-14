import SwiftUI
import SwiftData
struct ContentView: View {
    @State private var profilePic = "👵"
    
    
//    class profile: ObservableObject{
//        @Published var profilePic = ""
//    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("GroupSyncLightGreen")
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        Spacer()
                        Menu(profilePic) {
                            Button("👵 Sarah") {
                                profilePic = "👵"
                            }
                            Button("🐱 Arohi") {
                                profilePic = "🐱"
                            }
                            Button("👑 Medha") {
                                profilePic = "👑"
                            }
                            Button("😃 Guest User") {
                                profilePic = "😃"
                            }
                            
                        }
                        .font(.largeTitle)
                    }
                    .padding()
                    
                    Text("GroupSync")
                       .font(.custom("Dosis", size: 46))
                      
                        .padding()
                 
                    
                    Image("launchScreen")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20)
                        .padding()
                        .padding()
                    NavigationLink(destination: EventsListView()) {
                        Text("Edit Your Schedule")
                            .font(.custom("Dosis-Bold", size: 36))
                            
                            .foregroundColor(Color.black)
                            .frame(width: 290, height: 95, alignment: .center)
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                    .tint(.white)
                    
                    NavigationLink(destination: SeeAvaliability()) {
                        Text("See Avaliability")
                            .font(.largeTitle)
                            
                            .foregroundColor(Color.black)
                            .frame(width: 290, height: 95, alignment: .center)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.white)
            Spacer()
                }
                .padding()
            }
            
            
        }
    }
}

#Preview {
    ContentView()
}
