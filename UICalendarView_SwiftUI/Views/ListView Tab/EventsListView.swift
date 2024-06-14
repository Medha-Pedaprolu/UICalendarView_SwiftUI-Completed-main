//
// Created for UICalendarView_SwiftUI
// by Stewart Lynch on 2022-06-29
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//

import SwiftUI

struct EventsListView: View {
    @EnvironmentObject var myEvents: EventStore
//    @EnvironmentObject var thisEvent: Event
    @State private var formType: EventFormType?
//    @State var profilePic : String
    var body: some View {
        NavigationStack {
            ZStack {
                Color("GroupSyncLightGreen")
                    .ignoresSafeArea()
            List {
                ForEach(myEvents.events.sorted {$0.date < $1.date }) { event in
                    //                    if(profilePic == event.eventType.rawValue){
                    ListViewRow(event: event, formType: $formType)
                        .swipeActions {
                            Button(role: .destructive) {
                                myEvents.delete(event)
                            } label: {
                                Image(systemName: "trash")
                            }
                        }
                    //}
                }
            }
            
            .navigationTitle("Calendar Events")
            .navigationBarHidden(false)
            .sheet(item: $formType) { $0 }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        formType = .new
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .frame(width: 37.0, height: 37.0)
                            .imageScale(.medium)
                    }
                }
            }
        }

        }
        
       
    }
}

struct EventsListView_Previews: PreviewProvider {
    static var previews: some View {
        EventsListView()
            .environmentObject(EventStore(preview: true))
    }
}
