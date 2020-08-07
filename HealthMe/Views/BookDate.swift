//
//  BookDate.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 06/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct BookDate: View {
    var body: some View {
        ScrollView {
            VStack { //Container
                
                
                VStack { //Section
                    Header(title: "When", subtitle: "Select a date and time")
                }//Section
                
                //Datepicker
                VStack {
                    
                    HStack(alignment: .center, spacing: 5) {
                        Image(systemName: "chevron.left").padding(.trailing, 8).font(.system(size: 20, weight: .semibold))
                        DateSelect(state: "selected")
                        DateSelect(state: "noavailable")
                        DateSelect(state: "")
                        DateSelect(state: "")
                        Image(systemName: "chevron.right").padding(.leading, 8).font(.system(size: 20, weight: .semibold))
                    }.padding()
                    
                    
                    VStack { //Section
                        Text("Friday, August 19th 2020").font(.system(size: 18, weight: .semibold))
                        Spacer()
                        VStack(alignment: .trailing) {
                            HStack {
                                Text("AM").fontWeight(.bold)
                                Text("09:00")
                                Text("09:30")
                                Text("10:00")
                            }.padding()
                            
                            HStack {
                                Text("09:00")
                                Text("09:30")
                                Text("10:00")
                            }.padding()
                        }.padding().font(.system(size: 18, weight: .medium))
                        
                        VStack(alignment: .trailing) {
                            HStack {
                                Text("PM").fontWeight(.bold)
                                Text("02:00")
                                Text("02:30")
                                Text("03:00")
                            }.padding()
                            
                            HStack {
                                Text("03:00")
                                Text("04:30")
                                Text("04:00")
                            }.padding()
                        }.padding().font(.system(size: 18, weight: .medium))
                        
                    }.padding() //Section
                    
                } //Datepicker
                
            } //Container
                .navigationBarTitle("Book Test")
        }
    }
}

struct BookDate_Previews: PreviewProvider {
    static var previews: some View {
        BookDate().environment(\.sizeCategory, .extraSmall)
    }
}
