//
//  PaymentView.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 24/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI
import iPaymentButton

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
                                .stroke(Color.themeReverse, lineWidth: 3)
                        )
                        Text("Health Me blood test fixed cost").padding()
                    }
                    
                    NavigationLink(destination: CardDetailsView()){
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Bank Card").font(.system(size: 18, weight: .bold))
                            HStack(alignment: .center, spacing: 20) {
                                Image("visa").resizable().aspectRatio(contentMode: .fill).frame(width: 50)
                                Image("mastercard2").resizable().aspectRatio(contentMode: .fill).frame(width: 50)
                            }.padding(15).overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.border, lineWidth: 2))
                        }.padding().frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    }.buttonStyle(PlainButtonStyle())
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Other Methods").font(.system(size: 18, weight: .bold))
                        HStack(alignment: .center, spacing: 20) {
                            //Image("applepay2").resizable().aspectRatio(contentMode: .fill).frame(width: 50)
                            iPaymentButton(type: .inStore, style: .automatic) {
                                iPaymentButton.applePayDemo()
                            }.cornerRadius(8).frame(width: 140).padding(.leading, 7).font(.system(size: 30))
                        }
                        //.padding(15).overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.border, lineWidth: 2))
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
