//
//  ReviewView.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 28/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI
import MapKit

struct ReviewView: View {
    
    @ObservedObject var account: AccountViewModel = .account
    @State var showMap = false
    
    @State var region = MKCoordinateRegion()
    @State var places = [Place(name: "", latitude: 0, longitude: 0)]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                
                VStack{
                    Header(title: "Review", subtitle: "Review your booking")
                }.padding(.bottom, 10)
                
                VStack(alignment: .leading, spacing: 8) {
                    Group {
                        Text("Full Name").fontWeight(.bold)
                        Text(account.userModel!.fullname)
                        Text("Email").fontWeight(.bold).padding(.top, 20)
                        Text(account.userModel!.email)
                    }
                    Rectangle().fill(LinearGradient(gradient: Gradient(colors: [Color(red: 80/255, green: 25/255, blue: 235/255), Color(red: 135/255, green: 49/255, blue: 234/255), Color(red: 214/255, green: 66/255, blue: 188/255), Color(red: 255/255, green: 86/255, blue: 135/255), Color(red: 255/255, green: 151/255, blue: 114/255), Color(red: 255/255, green: 220/255, blue: 120/255)]), startPoint: .leading, endPoint: .trailing)).frame(height: 2)
                    Group {
                        Text("Payment Method").fontWeight(.bold).padding(.top, 25)
                        Text("Credit Card")
                        Text("Card Number").fontWeight(.bold).padding(.top, 20)
                        Text("**** **** **** \(substring(account.aCreditCard.cardNumber, 12))").padding(.bottom, 25)
                    }
                    Rectangle().fill(LinearGradient(gradient: Gradient(colors: [Color(red: 80/255, green: 25/255, blue: 235/255), Color(red: 135/255, green: 49/255, blue: 234/255), Color(red: 214/255, green: 66/255, blue: 188/255), Color(red: 255/255, green: 86/255, blue: 135/255), Color(red: 255/255, green: 151/255, blue: 114/255), Color(red: 255/255, green: 220/255, blue: 120/255)]), startPoint: .leading, endPoint: .trailing)).frame(height: 2)
                    VStack {
                        HStack(alignment: .bottom) {
                            VStack(alignment: .leading, spacing: 10) {
                                Text(account.aBooking.location).fontWeight(.bold)
                                Text(account.aBooking.address)
                            }.padding(.trailing)
                            VStack {
                                Image("map_icon").resizable().aspectRatio(contentMode: .fit).frame(width: 24)
                                Button(action: {
                                    self.showMap.toggle()
                                }) {
                                    Text("See map").font(.system(size: 14)).underline().foregroundColor(Color.primary)
                                }.sheet(isPresented: $showMap){
                                    MapView(region: $region, places: $places)
                                }
                            }
                        }.padding(.bottom, 20)
                        HStack {
                            Image(systemName: "calendar").resizable().aspectRatio(contentMode: .fit).frame(width: 40)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(dateToString(date: account.aBooking.date, format: "text"))
                                Text(account.aBooking.time)
                            }
                        }
                    }.padding(.top, 25)
                    
                }.padding(25).background(Color.theme).cornerRadius(16).shadow(color: Color.shadow, radius: 7, x: 0, y: 2).frame(width: 320)
            }
            
            VStack {
                NavigationLink(destination: ConfirmationView()) {
                    Text("Confirm").padding(EdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 30)).background(Color.theme).cornerRadius(22).font(.system(size: 20, weight: .bold))
                        .overlay(
                            RoundedRectangle(cornerRadius: 22)
                                .stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 80/255, green: 25/255, blue: 235/255), Color(red: 135/255, green: 49/255, blue: 234/255), Color(red: 214/255, green: 66/255, blue: 188/255), Color(red: 255/255, green: 86/255, blue: 135/255), Color(red: 255/255, green: 151/255, blue: 114/255), Color(red: 255/255, green: 220/255, blue: 120/255)]), startPoint: .leading, endPoint: .trailing), lineWidth: 4)
                        ).font(.system(size: 17, weight: .semibold)).foregroundColor(Color.primary)
                }
                
                Text("You'll be charged £10").font(.system(size: 14)).foregroundColor(Color.gray).padding(.top, 15)
            }.padding(.vertical, 25)
            
        }.navigationBarTitle("Book Test").onAppear(){
            places = [Place(name: account.aBooking.location, latitude: account.aStationLatitude, longitude: account.aStationLongitude)]
            region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: account.aStationLatitude, longitude: account.aStationLongitude),
                span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
        }
    }
    
    // retrieves n number of characters from a string
    func substring(_ str: String, _ num: Int) -> String {
        let index = str.index(str.startIndex, offsetBy: num)
        return String(str.suffix(from: index))
    }
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView()
    }
}
