//
//  CreditCard.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 27/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct CreditCard: View {
    
    @ObservedObject var account: AccountViewModel = .account
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
                Text(account.aCreditCard.cardNumber.replacingOccurrences(of: "(\\d{4})(\\d{4})(\\d{4})(\\d+)", with: "$1 $2 $3 $4", options: .regularExpression, range: nil)).fontWeight(.semibold).frame(width: 235, alignment: .leading)
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("CARD HOLDER").font(.custom("Courier", size: 11)).fontWeight(.black)
                        Text(account.aCreditCard.cardHolder).font(.custom("Courier", size: 16)).fontWeight(.black)
                    }
                    Spacer()
                    VStack(alignment: .leading, spacing: 4) {
                        Text("EXPIRES").font(.custom("Courier", size: 11)).fontWeight(.black)
                        Text(account.aCreditCard.cardExpiresMonth.count > 0 || account.aCreditCard.cardExpiresYear.count > 0 ? account.aCreditCard.cardExpiresMonth + "/" + account.aCreditCard.cardExpiresYear : "").font(.custom("Courier", size: 16)).fontWeight(.black)
                    }
                }
                
            }.padding(20).foregroundColor(Color.white).font(.custom("Courier", size: 20)).placedOnCard().flipRotate(flipDegrees).opacity(isFlipped ? 0.0 : 1.0).animation(.easeInOut(duration: 0.8))
            VStack {
                Rectangle().fill(Color.black).frame(height: 33)
                Text("CVV").font(.system(size: 14, weight: .black)).foregroundColor(Color.white).padding(.top, 5)
                HStack {
                    Text("\(account.aCreditCard.cardCVV)").padding(.trailing, 5).frame(width: 200, height: 25, alignment: .trailing).background(Color.white).foregroundColor(.black)
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
        return frame(width: 290, height: 180).background(LinearGradient(gradient: Gradient(colors: [Color(red: 255/255, green: 182/255, blue: 43/255), Color(red: 255/255, green: 22/255, blue: 87/255), Color(red: 255/255, green: 2/255, blue: 155/255)]), startPoint: .bottomLeading, endPoint: .topTrailing)).cornerRadius(16).shadow(color: Color(red: 200/255, green: 200/255, blue: 200/255), radius: 7, x: 0, y: 2).padding()
    }
}

struct CreditCard_Previews: PreviewProvider {
    static var previews: some View {
        CreditCard(isFlipped: .constant(true))
    }
}
