//
//  OnboardingView.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 15/01/2021.
//  Copyright © 2021 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct OnboardingView: View {
    @State var showLogin = false
    @State var showRegister = false
    
    @ObservedObject var account: AccountViewModel = .account
    
    var body: some View {
        if showRegister {
            SignUpView()
        } else {
            VStack {
                VStack(spacing: 0){
                    Text("Health Me").font(.system(size: 30, weight: .bold)).padding(25)
                    Text("Blood test results that are\n easier to understand").font(.system(size: 20, weight: .medium)).foregroundColor(blueGray).multilineTextAlignment(.center).lineSpacing(4)
                    Image("highlight").resizable().frame(width: 190, height: 20)
                }
                Spacer()
                Image("onboarding2").resizable().aspectRatio(contentMode: .fit).frame(width: 240, height: 240).padding(.bottom)
                Spacer()
                VStack {
                    Button(action: {
                        self.showRegister.toggle()
                    }) {
                        Text("Register")
                            .font(.system(size: 21, weight: .regular))
                            .foregroundColor(.primary)
                            .padding(EdgeInsets(top:7, leading: 33, bottom:7, trailing: 33))
                            .background(
                                RoundedRectangle(cornerRadius: 50)
                                    .fill(Color.theme)
                                    .shadow(color: .shadow, radius: 5, x: 4, y: 4)
                            )
                    }.padding(18)
                    HStack {
                        
                        ///FIXME: REMOVE onTapGesture() (development only)
                        Text("Already have an account?").foregroundColor(blueGray).onTapGesture {
                            account.login("tavo", "123456"){
                                if account.isLogged {
                                    self.showLogin.toggle() //hide login sheet
                                    self.account.showApp = true //show main app (hide start screen)
                                }
                            }
                        }
                        ///---FIXME
                        
                        Text("Log in").underline().foregroundColor(.green).onTapGesture {
                            self.showLogin.toggle()
                        }.sheet(isPresented: $showLogin){
                            LoginView(showLogin: self.$showLogin)
                        }
                    }.font(.system(size: 13.5))
                }.padding(.bottom)
                Spacer()
                Text("Skip").font(.system(size: 14, weight: .medium)).frame(maxWidth: .infinity, alignment: .trailing).padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 22)).onTapGesture {
                    self.account.showApp = true
                }
            }.preferredColorScheme(account.isDark ? .dark : .light)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
