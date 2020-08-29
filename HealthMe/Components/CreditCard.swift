//
//  CreditCard.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 27/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct CreditCard: View {
    
    @Binding var cardNumber: String
    @Binding var cardHolder: String
    @Binding var cardExpiresMonth: String
    @Binding var cardExpiresYear: String
    @Binding var cardCVV: String
    @Binding var isFlipped: Bool
    
    var body: some View {
        let flipDegrees = isFlipped ? 180.0 : 0
        return ZStack{
            VStack(alignment: .center, spacing: 30) {
                HStack {
                    Image("card_chip").resizable().aspectRatio(contentMode: .fit).frame(width: 35)
                    Spacer()
                    Image("visa_label").resizable().aspectRatio(contentMode: .fit).frame(width: 75)
                }
                Text(self.cardNumber).fontWeight(.semibold).frame(width: 235, alignment: .leading)
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("CARD HOLDER").font(.custom("Courier", size: 11)).fontWeight(.black)
                        Text(self.cardHolder).font(.custom("Courier", size: 16)).fontWeight(.black)
                    }
                    Spacer()
                    VStack(alignment: .leading, spacing: 4) {
                        Text("EXPIRES").font(.custom("Courier", size: 11)).fontWeight(.black)
                        Text(self.cardExpiresMonth.count > 0 || self.cardExpiresYear.count > 0 ? self.cardExpiresMonth + "/" + self.cardExpiresYear : "").font(.custom("Courier", size: 16)).fontWeight(.black)
                    }
                }
                
            }.padding(20).foregroundColor(Color.white).font(.custom("Courier", size: 20)).placedOnCard().flipRotate(flipDegrees).opacity(isFlipped ? 0.0 : 1.0).animation(.easeInOut(duration: 0.8))
            VStack {
                Rectangle().frame(height: 33)
                Text("CVV").font(.system(size: 14, weight: .black)).foregroundColor(Color.white).padding(.top, 5)
                HStack {
                    Text(self.cardCVV).padding(.trailing, 5).frame(width: 200, height: 25, alignment: .trailing).background(Color.white)
                    Spacer()
                }
                Spacer()
                HStack {
                    Spacer()
                    Image("visa_label").resizable().aspectRatio(contentMode: .fit).frame(width: 50)
                }.padding(.trailing, 20)
            }.padding(.vertical, 30).placedOnCard().flipRotate(-180 + flipDegrees).opacity(isFlipped ? 1.0 : 0.0).animation(.easeInOut(duration: 0.8))
        }
    }
}

extension View {
    func flipRotate(_ degrees : Double) -> some View {
        return rotation3DEffect(Angle(degrees: degrees), axis: (x: 0.0, y: 1.0, z: 0.0))
    }
    func placedOnCard() -> some View {
        return frame(width: 290, height: 180).background(LinearGradient(gradient: Gradient(colors: [Color(red: 255/255, green: 182/255, blue: 43/255), Color(red: 255/255, green: 22/255, blue: 87/255), Color(red: 255/255, green: 2/255, blue: 155/255)]), startPoint: .bottomLeading, endPoint: .topTrailing)).cornerRadius(16).shadow(color: Color(red: 200/255, green: 200/255, blue: 200/255), radius: 7, x: 0, y: 2).padding().animation(.easeInOut(duration: 0.8))
    }
}

struct CreditCard_Previews: PreviewProvider {
    static var previews: some View {
        CreditCard(cardNumber: .constant("5436 4755 8990 2334"), cardHolder: .constant("Gustavo Zapata"), cardExpiresMonth: .constant("07"), cardExpiresYear: .constant("24"), cardCVV: .constant("333"), isFlipped: .constant(false))
    }
}
