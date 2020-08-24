//
//  BookTestView.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 16/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct BookStation: View {
    
    @State var stationId = -1
    
    //    @ViewBuilder
    var body: some View {
        
        VStack {
            
            ScrollView {
                
                VStack {
                    VStack(alignment: .leading, spacing: 30) {
                        Header(title: "Blood Station", subtitle: "Select a blood station")
                    }
                    
                    VStack(alignment: .center) {
                        StationList(stations: BloodStationData(), stationId: self.$stationId)
                        
                        Spacer()
                    }
                }
                .navigationBarTitle("Book Test")
                }
            
            if stationId > -1 {
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
