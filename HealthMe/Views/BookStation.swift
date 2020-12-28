//
//  BookTestView.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 16/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct BookStation: View {
    
    @State var stationId = ""
    @ObservedObject var stationListVM = StationListViewModel()
    var modify: Bool
    
    init(modify: Bool = false){
        self.modify = modify
    }
    
    //        @ViewBuilder
    var body: some View {
        
        VStack {
            ScrollView {
                VStack {
                    VStack {
                        Header(title: "Blood Station", subtitle: "Select a blood station")
                    }.padding(.bottom, -10)
                    
                    SearchBar().padding(.bottom, 10)
                    
                    if modify == true {
                        ModifyBanner()
                    }
                    
                    VStack(alignment: .center) {
                        if stationListVM.hasFetched {
                            ///Fetch version
                            StationListView(bloodStations: stationListVM.stations, stationId: self.$stationId)
                        } else {
                            ///Hardcoded version
                            StationList(stations: BloodStationData(), stationId: self.$stationId)
                        }
                        Spacer()
                    }
                }
                
            }.navigationBarTitle("Book Test")
            
            if stationId != "" {
                NavigationLink(destination: BookDate()){
                    ConfirmButton()
                }
            }
        }
    }
}

extension View {
    func buttonModifier() -> some View {
        return self.modifier(ButtonModifier())
    }
}

struct BookTestView_Preview: PreviewProvider {
    static var previews: some View {
        BookStation()
    }
}
