//
//  BloodTestsView.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 10/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct BookTestCard: View {
    var conic: LinearGradient
    
    init() {
        let colors = Gradient(colors: [Color(red: 80/255, green: 25/255, blue: 235/255), Color(red: 135/255, green: 49/255, blue: 234/255), Color(red: 214/255, green: 66/255, blue: 188/255), Color(red: 255/255, green: 86/255, blue: 135/255), Color(red: 255/255, green: 151/255, blue: 114/255), Color(red: 255/255, green: 220/255, blue: 120/255)])
        conic = LinearGradient(gradient: colors, startPoint: .leading, endPoint: .trailing)
    }
    var body: some View {
        VStack {
            Header(title: "Book Test", subtitle: "Book an appointment to the nearest blood station quick and easy")
            
            Image("nobookings").resizable().aspectRatio(contentMode: .fit).frame(width: 280).fixedSize().padding(.top, 55)
            
            NavigationLink(destination: BookTestView()){
                Text("Book a blood test").padding(EdgeInsets(top: 13, leading: 20, bottom: 13, trailing: 20)).background(Color.white).cornerRadius(25)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(conic, lineWidth: 4)
                ).font(.system(size: 17, weight: .semibold)).foregroundColor(Color.primary)
            }.padding(.bottom, 30)
            
        }.background(LinearGradient(gradient: Gradient(colors: [Color(red: 222/255, green: 251/255, blue: 255/255), Color(red: 219/255, green: 233/255, blue: 255/255)]), startPoint: .top, endPoint: .bottom)).cornerRadius(22).clipped().shadow(color: Color(red: 200/255, green: 200/255, blue: 200/255), radius: 7, x: 0, y: 2).padding()
    }
}

struct HorizontalSlider: View {
    var body: some View {
        HStack {
            ScrollView(.horizontal, showsIndicators: false){
                HStack {
                    VStack {
                        Text("Discover Health Me").font(.system(size: 20, weight: .bold))
                        Text("Swipe right to discover the power of Health Me in our lifes and how it can improve our overall health.").multilineTextAlignment(.center).padding()
                        Text("swipe >>>").foregroundColor(Color(red: 23/255, green: 108/255, blue: 236/255)).fontWeight(.semibold)
                        //                Spacer()
                    }.padding().background(Color.white).cornerRadius(23).frame(minWidth: 0, maxWidth: 420, minHeight: 0, maxHeight: 300, alignment: .topLeading)
                    
                    VStack {
                        HStack {
                            Text("1")
                            Spacer()
                            Text("Book now")
                        }
                        Image("discover01").resizable().frame(width: 170, height: 110)
                        Text("Book a blood test appointment")
                    }.padding().background(Color.white).cornerRadius(23).frame(minWidth: 0, maxWidth: 420, minHeight: 0, maxHeight: 300, alignment: .topLeading)
                }
                
            }
        }.padding().background(Color(red: 245/255, green: 247/255, blue: 250/255))
    }
}

//struct DiscoverHealthMe: View {
//    var body: some View {
//
//    }
//}

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
                    
                    BookTestCard().padding(.bottom, 30)
                    Spacer()
                    HorizontalSlider()
                    Spacer()
                    //                    Divider().frame(width: UIScreen.main.bounds.width - 40)
                    
                    //Section - Past Tests
                    VStack {
                        Header(title: "Past Tests", subtitle: "See your blood tests booking history")
                        
                        Text("You haven’t booked any blood test") //You don’t have any blood test booked
                            .font(.system(size: 18)).foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5, opacity: 1.0)).multilineTextAlignment(.center).padding(.bottom, 20)
                    }.padding(.top, 20)
                    
                }.padding(.bottom, 30)
                //Container
                
            } //ScrollView
                .navigationBarTitle("Blood Tests")
        }
    }
}

struct BloodTestsView_Previews: PreviewProvider {
    static var previews: some View {
        BloodTestsView()
        //        BloodTestsView().environment(\.colorScheme, .dark)
    }
}
