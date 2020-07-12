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
    
    init() {
        let colors = Gradient(colors: [.green, .orange, .pink, .red, .purple])
        conic = LinearGradient(gradient: colors, startPoint: .leading, endPoint: .trailing)
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 15) {
                VStack{
                    Image("nobookings").resizable().aspectRatio(contentMode: .fit).frame(width: 250, height: 200).clipped()
                    //                        .border(Color.black)
                    Text("You don’t have any blood test booked")
                        .font(.system(size: 16)).foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5, opacity: 1.0))
                }
                
                VStack(alignment: .center, spacing: 30) {
                    Text("Book Test").font(.system(size: 28, weight: .bold))
                    Text("Book an appointment to the nearest blood station quick and easy").multilineTextAlignment(.center)
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("Book blood test").padding(12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(conic, lineWidth: 4)
                        ).font(.system(size: 17, weight: .semibold)).foregroundColor(Color.black)
                    }
                }.padding(.top, 35)
                Spacer()
            }
            .navigationBarTitle("Blood Tests")
        }
    }
}

struct BloodTestsView_Previews: PreviewProvider {
    static var previews: some View {
        BloodTestsView()
    }
}
