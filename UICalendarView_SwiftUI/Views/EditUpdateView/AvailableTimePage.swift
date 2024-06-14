//
//  AvailableTimePage.swift
//  GroupSync
//
//  Created by Scholar on 6/12/24.
//

import SwiftUI


struct users: Hashable{
    let id: String
    let name: String
    
}


struct AvailableTimePage: View {
    @State private var date:String = "Demo Party"
    //update this variable to the actual date
    
    
    @State private var num = 1
    //@Binding var users : [Users]
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color("GroupSyncLightGreen")
                    .ignoresSafeArea()
            VStack(alignment: .center){
                HStack(){
                    Text(date)
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .bold()
                    
                }
                .padding()
                Text("Group Members:")
                    .font(.title)
            }
        }
            .padding()
            
            List{
                
                Text("1. Arohi")
                Text("2. Medha")
                Text("3. Sarah")
                
                
            }
            NavigationLink(destination: EventsCalendarView()) {
                Text("View Availability ->")
                    .font(.title2)
                    
            }
            .padding()
            //loop this for every item?
            
        }
    }
    struct EventsCalendarView_Previews: PreviewProvider {
        static var previews: some View {
            EventsCalendarView()
                .environmentObject(EventStore(preview: true))
        }
    }
}

#Preview {
    AvailableTimePage()
}






