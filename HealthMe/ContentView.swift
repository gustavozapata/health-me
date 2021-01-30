//
//  ContentView.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 10/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    
    @ObservedObject var account: AccountViewModel = .account
    
    init() {
        //Make List only the height of its content
        UITableView.appearance().tableFooterView = UIView()
    }
    
    var body: some View {
        if !self.account.showApp {
            OnboardingView()
        } else {
            TabView(selection: $selection){
                BloodTestsView()
                    .tabItem {
                        VStack {
                            //                        Text("Health")
                            //                        Image("blood")
                            Image(systemName: "circle.bottomthird.split")
                                .font(.system(size: 32.0, weight: .black))
                        }
                    }
                    .tag(0)
                
                BloodResultsView()
                    .tabItem {
                        VStack {
                            Image(systemName: "waveform.path.ecg")//doc.plaintext
                                .font(.system(size: 25.0, weight: .black))
                        }
                    }
                    .tag(1)
                
                //            NutritionView()
                MessagesView(message: MessagesData())
                    .tabItem {
                        VStack {
                            //                        Image(systemName: "heart")
                            Image(systemName: "message")
                                .font(.system(size: 25.0, weight: .black))
                        }
                    }
                    .tag(2)
                
                
                ProfileView(profile: ProfileData())
                    .tabItem {
                        VStack {
                            //                        Image("profile")
                            Image(systemName: "person")
                                .font(.system(size: 25.0, weight: .black))
                        }
                    }
                    .tag(3)
            }.accentColor(.green).onAppear(perform: {
                selection = 0 //show initial view when logging in
            }) //Color(UIColor(hex: "#F61767ff")!): rosa, #3581F2ff: azul
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //                        .environment(\.colorScheme, .dark)
    }
}
