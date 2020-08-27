//
//  CardDetailsView.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 24/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct CardDetailsView: View {
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    
                    HStack(alignment: .top) {
                        Header(title: "Payment", subtitle: "Enter your payment details")
                        Text("Cancel").underline().foregroundColor(Color(red: 111/255, green: 111/255, blue: 111/255)).padding()
                    }
                    
                    //                    Image("card").resizable().aspectRatio(contentMode: .fit).frame(width: 300)
                    CreditCard()
                    
                    //Form
                    VStack {
                        VStack(alignment: .leading, spacing: 7) {
                            Text("CARD NUMBER").fontWeight(.bold).font(.system(size: 15))
                            TextField("", text: .constant("")).frame(height: 42)
                                .padding([.leading, .trailing], 4)
                                .cornerRadius(16)
                                .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color(red: 97/255, green: 137/255, blue: 240/255), lineWidth: 2))
                        }.padding(.bottom, 10)
                        VStack(alignment: .leading, spacing: 7) {
                            Text("CARD HOLDER").fontWeight(.bold).font(.system(size: 15))
                            TextField("", text: .constant("")).frame(height: 42)
                                .padding([.leading, .trailing], 4)
                                .cornerRadius(16)
                                .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color(red: 97/255, green: 137/255, blue: 240/255), lineWidth: 2))
                        }.padding(.bottom, 10)
                        HStack {
                            VStack(alignment: .leading, spacing: 7) {
                                Text("EXPIRES").fontWeight(.bold).font(.system(size: 15))
                                HStack {
                                    TextField("MONTH", text: .constant("")).frame(width: 75, height: 42).font(.system(size: 15, weight: .bold)).foregroundColor(Color(red: 119/255, green: 119/255, blue: 119/255))
                                        .padding([.leading, .trailing], 4)
                                        .cornerRadius(16)
                                        .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color(red: 97/255, green: 137/255, blue: 240/255), lineWidth: 2))
                                    TextField("YEAR", text: .constant("")).frame(width: 75, height: 42)
                                        .font(.system(size: 15, weight: .bold)).foregroundColor(Color(red: 119/255, green: 119/255, blue: 119/255))
                                        .padding([.leading, .trailing], 4)
                                        .cornerRadius(16)
                                        .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color(red: 97/255, green: 137/255, blue: 240/255), lineWidth: 2))
                                }
                            }
                            Spacer()
                            VStack(alignment: .leading, spacing: 7)  {
                                Text("CVV").fontWeight(.bold).font(.system(size: 15))
                                TextField("", text: .constant("")).frame(width: 75,height: 42)
                                    .padding([.leading, .trailing], 4)
                                    .cornerRadius(16)
                                    .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color(red: 97/255, green: 137/255, blue: 240/255), lineWidth: 2))
                            }
                            
                        }.padding(.bottom, 30)
                        
                        //                        BookTestButton()
                        Text("Next").padding(EdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 30)).background(Color.white).cornerRadius(22).font(.system(size: 20, weight: .bold))
                            .overlay(
                                RoundedRectangle(cornerRadius: 22)
                                    .stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 255/255, green: 67/255, blue: 66/255), Color(red: 255/255, green: 150/255, blue: 1/255), Color(red: 1/255, green: 167/255, blue: 167/255), Color(red: 1/255, green: 135/255, blue: 144/255), Color(red: 239/255, green: 55/255, blue: 11/255)]), startPoint: .leading, endPoint: .trailing), lineWidth: 4)
                        ).font(.system(size: 17, weight: .semibold)).foregroundColor(Color.primary)
                        Text("You won’t be charged. Next to review page").font(.system(size: 14)).foregroundColor(Color.gray).padding(.top, 10)
                        
                    }.padding(28)
                    
                }
            }
        }
    }
}

struct CardDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CardDetailsView()
    }
}
