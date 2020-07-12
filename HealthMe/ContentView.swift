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
    
    var body: some View {
        TabView(selection: $selection){
            BloodTestsView()
                .tabItem {
                    VStack {
//                        Text("Health")
                        Image(systemName: "waveform.path.ecg")
                            .font(.system(size: 25.0, weight: .black))
                    }
            }
            .tag(0)
            
            BloodResultsView()
                .tabItem {
                    VStack {
                        Image(systemName: "doc.plaintext")
                            .font(.system(size: 25.0, weight: .black))
                    }
            }
            .tag(1)
            
            NutritionView()
                .tabItem {
                    VStack {
                        Image(systemName: "heart")
                            .font(.system(size: 25.0, weight: .black))
                    }
            }
            .tag(2)
            
            
            ProfileView(profile: ProfileData())
                .tabItem {
                    VStack {
                        Image(systemName: "person")
                            .font(.system(size: 25.0, weight: .black))
                    }
            }
            .tag(3)
        }.accentColor(.green)
//            .padding(.all)
//        .accentColor(Color(UIColor(hex: "#F61767ff")!)) //rosa
//        .accentColor(Color(UIColor(hex: "#3581F2ff")!)) //azul
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//        .environment(\.colorScheme, .dark)
    }
}
