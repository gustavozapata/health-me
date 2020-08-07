//
//  BloodTestsView.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 10/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct BloodTestsView: View {
    var conic: LinearGradient
    var w: Int
    @Environment(\.colorScheme) var colorScheme
    init() {
        let colors = Gradient(colors: [.green, .orange, .pink, .red, .purple])
        conic = LinearGradient(gradient: colors, startPoint: .leading, endPoint: .trailing)
        w = Int(UIScreen.main.bounds.width)
    }
    
    var body: some View {
        NavigationView {
            
            ScrollView {
                
                //Container
                VStack {
                    
                    //Section - Book Test
                    VStack {
                        
                        Header(title: "Book Test", subtitle: "Book an appointment to the nearest blood station quick and easy")
                        
                        //Image and button
                        VStack(alignment: .center) {
//                            GeometryReader{ geo in
//                                Image("nobookings").resizable().aspectRatio(contentMode: .fit).frame(width: geo.size.width)
//                            }
                            
                            Image("nobookings").resizable().aspectRatio(contentMode: .fit).frame(minWidth: 100, maxWidth: CGFloat(w-40), minHeight: 250, maxHeight: .infinity)
                            
                            NavigationLink(destination: BookTestView()){
                                Text("Book blood test").padding(14)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 25)
                                            .stroke(conic, lineWidth: 4)
                                ).font(.system(size: 17, weight: .semibold)).foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                            }
                            
                        }
                        //Image and button
                        
                    }.padding(.bottom, 40) //Section
                    
                    Divider().frame(width: UIScreen.main.bounds.width - 40)
                    
                    //Section - Past Tests
                    VStack {
                        Header(title: "Past Tests", subtitle: "See your blood tests booking history")
                        
                        Text("You don’t have any blood test booked")
                            .font(.system(size: 18)).foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5, opacity: 1.0)).multilineTextAlignment(.center).padding(.bottom, 20)
                    }.padding(.top, 20)
                    
                }.padding(.bottom, 30) //Container
                
            } //ScrollView
                .navigationBarTitle("Blood Tests")
        }
    }
}

struct BloodTestsView_Previews: PreviewProvider {
    static var previews: some View {
        BloodTestsView()
    }
}
