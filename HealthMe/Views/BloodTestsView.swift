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
                
                VStack(alignment: .center, spacing: 15) {
                    
                    //BOOK TEST
                    VStack{
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Book Test").font(.system(size: 28, weight: .bold))
                            Text("Book an appointment to the nearest blood station quick and easy").font(.system(size: 16)).padding(.bottom, 20)
                        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity, alignment: .topLeading).padding()
                        
                        VStack {
                            Image("nobookings").resizable().aspectRatio(contentMode: .fit).frame(width: CGFloat(w - 50), height: 220).clipped()
                            
                            NavigationLink(destination: BookTestView()){
                                Text("Book blood test").padding(12)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 25)
                                            .stroke(conic, lineWidth: 4)
                                ).font(.system(size: 17, weight: .semibold)).foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                            }
                        }
                        
                        
                    }
                    
                    Divider().frame(width: UIScreen.main.bounds.width - 40)
                    
                    //PAST TESTS
                    VStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Past Tests").font(.system(size: 28, weight: .bold))
                            Text("See your blood tests booking history").font(.system(size: 16))
                            
                            
                        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading).padding()
                        Text("You don’t have any blood test booked")
                            .font(.system(size: 18)).foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5, opacity: 1.0)).multilineTextAlignment(.center).padding(.top, 22)
                        
                    }
                    
                    Spacer()
                }
                .navigationBarTitle("Blood Tests")
            }
        }
    }
}

struct BloodTestsView_Previews: PreviewProvider {
    static var previews: some View {
        BloodTestsView()
    }
}
