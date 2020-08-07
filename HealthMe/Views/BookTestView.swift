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
                        Text("Next").font(.system(size: 18, weight: .bold)).foregroundColor(Color.black).padding(EdgeInsets(top: 8, leading: 22, bottom: 8, trailing: 22)).overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.black, lineWidth: 2)).background(Color.white)
                    }.padding(.top, 30)
                }
            }
            .navigationBarTitle("Book Test")
        }
    }
}

struct BookTestView_Preview: PreviewProvider {
    static var previews: some View {
        BookTestView()
    }
}
