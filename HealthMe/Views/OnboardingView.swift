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
    @Binding var skip: Bool
    
    var body: some View {
        if showRegister {
            SignUpView(skip: $skip)
        } else {
            VStack {
                VStack{
                    Text("Health Me").font(.system(size: 30, weight: .bold)).padding(3)
                    Text("Blood test results that are\n easier to understand").font(.system(size: 20, weight: .medium)).foregroundColor(blueGray).multilineTextAlignment(.center).lineSpacing(4)
                }
                Image("onboarding2").resizable().aspectRatio(contentMode: .fit).frame(width: 220, height: 220).padding(.bottom)
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
                                    .fill(Color.white)
                                    .shadow(color: lightBorder, radius: 5, x: 4, y: 4)
                            )
                    }.padding(8)
                    HStack {
                        Text("Already have an account?").foregroundColor(blueGray)
                        Text("Log in").underline().foregroundColor(.green).onTapGesture {
                            self.showLogin.toggle()
                        }.sheet(isPresented: $showLogin){
                            LoginView(showLogin: self.$showLogin)
                        }
                    }.font(.system(size: 13.5))
                }.padding(.bottom)
                Text("Skip").font(.system(size: 14, weight: .medium)).frame(maxWidth: .infinity, alignment: .trailing).padding(.trailing, 22).onTapGesture {
                    self.skip.toggle()
                }
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(skip: .constant(false))
    }
}
