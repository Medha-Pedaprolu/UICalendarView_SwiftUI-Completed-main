//
// Created for UICalendarView_SwiftUI
// by Stewart Lynch on 2022-06-28
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//

import SwiftUI

struct EventsCalendarView: View {
    @EnvironmentObject var eventStore: EventStore
    @State private var dateSelected: DateComponents?
    @State private var displayEvents = false
    @State private var formType: EventFormType?
    
    var body: some View {
        ZStack {
            Color("GroupSyncLightGreen")
                .ignoresSafeArea()
            VStack{
                
                //            HStack{
                //                Text("Group's Calendar")
                //                Spacer()
                //                Button{
                //
                //                }label: {
                //                    Text("+")
                //                }
                //            }
                //   .padding()
                NavigationStack {
                    ScrollView {
                        CalendarView(interval: DateInterval(start: .distantPast, end: .distantFuture),
                                     eventStore: eventStore,
                                     dateSelected: $dateSelected,
                                     displayEvents: $displayEvents)
                        .navigationTitle("Group's Calendar")
                        //                Image("launchScreen")
                        //                    .resizable()
                        //                    .scaledToFit()
                        //                    .frame(width: 100)
                        
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button {
                                    formType = .new
                                } label: {
                                    Image(systemName: "plus.circle.fill")
                                        .imageScale(.medium)
                                }
                            }
                        }
                        .sheet(item: $formType) { $0 }
                        .sheet(isPresented: $displayEvents) {
                            DaysEventsListView(dateSelected: $dateSelected)
                                .presentationDetents([.medium, .large])
                        }
                        
                        // .navigationTitle("Group's Calendar")
                        //.ignoresSafeArea()
                    }
                }
            }
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
    ContentView()
}
