//
//  PaymentView.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 24/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct PaymentView: View {
    
    @State var isMethodSelected = false
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    
                    VStack {
                        Header(title: "Payment", subtitle: "Choose a payment method")
                    }
                    
                    VStack {
                        Text("£10").padding(EdgeInsets(top: 30, leading: 15, bottom: 30, trailing: 15)).font(.system(size: 60, weight: .bold)).overlay(
                            RoundedRectangle(cornerRadius: 100)
                                .stroke(Color.black, lineWidth: 3)
                        )
                        Text("Health Me blood test fixed cost").padding()
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Bank Card").font(.system(size: 18, weight: .bold))
                        Button(action: {
                            self.isMethodSelected = true
                        }) {
                            HStack(alignment: .center, spacing: 20) {
                                Image("visa").resizable().aspectRatio(contentMode: .fill).frame(width: 50)
                                Image("mastercard").resizable().aspectRatio(contentMode: .fill).frame(width: 50)
                                Image("amex").resizable().aspectRatio(contentMode: .fill).frame(width: 50)
                            }.padding(15).overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(red: 159/255, green: 173/255, blue: 192/255), lineWidth: 2))
                        }.sheet(isPresented: $isMethodSelected){
                            CardDetailsView()
                        }.buttonStyle(PlainButtonStyle())
                    }.padding().frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Other Methods").font(.system(size: 18, weight: .bold))
                        HStack(alignment: .center, spacing: 15) {
                            IconButton(image: "applepay")
                            IconButton(image: "googlepay")
                            IconButton(image: "paypal")
                        }
                    }.padding(.horizontal).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                }.padding(.bottom, 15)
            }
            .navigationBarTitle("Book Test")
        }
    }
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView()
    }
}
