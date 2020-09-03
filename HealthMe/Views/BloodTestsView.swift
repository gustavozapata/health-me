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
    
    @State var isUpcomingTest = true
    
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
                    
                    if isUpcomingTest {
                        Header(title: "Upcoming Tests", subtitle: "These are your upcoming blood tests")
                        
                        NavigationLink(destination: BloodTestInfo(test: pastTestsData[0])){
                            AppointmentCard().padding(.bottom, 30)
                        }.buttonStyle(PlainButtonStyle())
                        
                        CardSection().padding([.top, .bottom], 30)
                    } else {
                        BookTestCard().padding(.bottom, 30).onAppear{
                            print("apareciendo...")
                        }.onDisappear{
                            print("desapareciendo...")
                        }
                        DiscoverHealthMe()
                    }
                    
                    HStack {
                        Text("use-case").foregroundColor(Color.red).onTapGesture{
                            self.isUpcomingTest.toggle()
                        }
                    }
                    
                    //Section - Past Tests
                    VStack {
                        Header(title: "Past Tests", subtitle: "See your blood tests booking history").padding(.bottom, 40)
                        
                        PastTestsList(pastTests: BloodTestData())
//                        Text("You haven’t booked any blood test").font(.system(size:18)).foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5, opacity: 1.0)).multilineTextAlignment(.center).padding(.bottom, 20)
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
        //BloodTestsView().environment(\.colorScheme, .dark)
    }
}
