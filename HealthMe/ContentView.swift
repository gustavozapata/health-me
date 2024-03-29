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
            if self.account.requiredPass && !self.account.isUnlocked {
                PasscodeView()
            } else {
                GeometryReader { geometry in
                    ZStack(alignment: .bottomLeading) {
                        TabView(selection: $selection){
                            BloodTestsView()
                                .tabItem {
                                    VStack {
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
                            
                            MessagesView()
                                .tabItem {
                                    VStack {
                                        Image(systemName: "message")
                                            .font(.system(size: 25.0, weight: .black)).background(Color.green)
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
                        }.accentColor(.green).preferredColorScheme(account.isDark ? .dark : .light).onAppear(perform: {
                            selection = 0 //show initial view when logging in
                        })
                        
                        //new message indicator
                        if account.newMsg {
                            Circle().foregroundColor(.green).frame(width: 10, height: 10).offset(x: geometry.size.width / 1.55, y: -30)
                        }
                    }.onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
                        account.isUnlocked = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
