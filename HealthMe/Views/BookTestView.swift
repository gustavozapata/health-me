//
//  BookTestView.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 16/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct BookTestView: View {
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                VStack(alignment: .leading, spacing: 30) {
                    Header(title: "Where", subtitle: "Select a blood station")
                }
                
                VStack(alignment: .center) {
                    StationList()
                    
                    Spacer()
                    
                    NavigationLink(destination: BookDate()){
//                        Text("Next").buttonModifier()
                        Text("Next").modifier(ButtonModifier())
                    }.padding(.top, 30)
                }
            }
            .navigationBarTitle("Book Test")
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
        BookTestView()
    }
}
