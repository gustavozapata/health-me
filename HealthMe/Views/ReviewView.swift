//
//  ReviewView.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 28/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct ReviewView: View {
    
    @State var showMap = false
    
    var body: some View {
        ScrollView {
            VStack {
                
                VStack{
                    Header(title: "Review", subtitle: "Review your booking")
                }
                
                VStack(alignment: .leading, spacing: 7) {
                    Group {
                        Text("Full Name").fontWeight(.bold)
                        Text("Gustavo Zapata")
                        Text("Email").fontWeight(.bold).padding(.top, 20)
                        Text("tavo@hotmail.com")
                        Text("Telephone").fontWeight(.bold).padding(.top, 20)
                        Text("07474559929").padding(.bottom, 20)
                    }
                    Rectangle().fill(LinearGradient(gradient: Gradient(colors: [Color(red: 80/255, green: 25/255, blue: 235/255), Color(red: 135/255, green: 49/255, blue: 234/255), Color(red: 214/255, green: 66/255, blue: 188/255), Color(red: 255/255, green: 86/255, blue: 135/255), Color(red: 255/255, green: 151/255, blue: 114/255), Color(red: 255/255, green: 220/255, blue: 120/255)]), startPoint: .leading, endPoint: .trailing)).frame(height: 2)
                    Group {
                        Text("Payment Method").fontWeight(.bold).padding(.top, 20)
                        Text("Credit Card - Visa")
                        Text("Card Number").fontWeight(.bold).padding(.top, 20)
                        Text("**** **** **** 9845").padding(.bottom, 20)
                    }
                    Rectangle().fill(LinearGradient(gradient: Gradient(colors: [Color(red: 80/255, green: 25/255, blue: 235/255), Color(red: 135/255, green: 49/255, blue: 234/255), Color(red: 214/255, green: 66/255, blue: 188/255), Color(red: 255/255, green: 86/255, blue: 135/255), Color(red: 255/255, green: 151/255, blue: 114/255), Color(red: 255/255, green: 220/255, blue: 120/255)]), startPoint: .leading, endPoint: .trailing)).frame(height: 2)
                    VStack {
                        HStack(alignment: .bottom) {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Kingston upon Thames").fontWeight(.bold)
                                Text("32 Richmong Rd.")
                            }.padding(.trailing)
                            VStack {
                                Image("map_icon").resizable().aspectRatio(contentMode: .fit).frame(width: 24)
                                Button(action: {
                                    self.showMap.toggle()
                                }) {
                                    Text("See map").font(.system(size: 14)).underline().foregroundColor(Color.primary)
                                }.sheet(isPresented: $showMap){
                                    MapView()
                                }
                            }
                        }.padding(.bottom, 20)
                        HStack {
                            Image(systemName: "calendar").resizable().aspectRatio(contentMode: .fit).frame(width: 40)
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Tue 22 Aug")
                                Text("11:00 AM")
                            }
                        }
                    }.padding(.top, 20)
                    
                }.padding(25).background(Color.white).cornerRadius(16).shadow(color: Color(red: 200/255, green: 200/255, blue: 200/255), radius: 7, x: 0, y: 2).frame(width: 320)
            }
            
            VStack {
                Text("Confirm").padding(EdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 30)).background(Color.white).cornerRadius(22).font(.system(size: 20, weight: .bold))
                    .overlay(
                        RoundedRectangle(cornerRadius: 22)
                            .stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 80/255, green: 25/255, blue: 235/255), Color(red: 135/255, green: 49/255, blue: 234/255), Color(red: 214/255, green: 66/255, blue: 188/255), Color(red: 255/255, green: 86/255, blue: 135/255), Color(red: 255/255, green: 151/255, blue: 114/255), Color(red: 255/255, green: 220/255, blue: 120/255)]), startPoint: .leading, endPoint: .trailing), lineWidth: 4)
                ).font(.system(size: 17, weight: .semibold)).foregroundColor(Color.primary)
                Text("You'll be charged £10").font(.system(size: 14)).foregroundColor(Color.gray).padding(.vertical, 15)
            }.padding(.top, 25)
            .navigationBarTitle("Book Test")
        }
    }
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView()
    }
}
