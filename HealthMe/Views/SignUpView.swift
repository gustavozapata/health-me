//
//  SignUpView.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 27/12/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    
    @State var fullname: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var showLogin = false
    
    @ObservedObject var account: AccountViewModel = .account
    
    private func signup() {
        account.signup(fullname, email, password) { //if login correct:
            if account.isLogged {
                account.showApp = true //show main app (hide start screen)
            }
        }
    }
    
    var body: some View {
        VStack {
            Header(title: "Register", subtitle: "Create an account")
            VStack{
                VStack(alignment: .leading){
                    Text("Full Name").font(.system(size: 14)).fontWeight(.semibold).foregroundColor(blueGray)
                    TextField("John Doe", text: $fullname)
                        .padding(10)
                        .cornerRadius(50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .padding(.bottom, 12)
                    Text("Email").font(.system(size: 14)).fontWeight(.semibold).foregroundColor(blueGray)
                    TextField("user@email.com", text: $email)
                        .padding(10)
                        .cornerRadius(50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .padding(.bottom, 12)
                    Text("Password").font(.system(size: 14)).fontWeight(.semibold).foregroundColor(blueGray)
                    SecureField("6+ characters", text: $password)
                        .padding(10)
                        .cornerRadius(50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .padding(.bottom, 35)
                }
                Text("Create account").fontWeight(.medium).padding(9)
                    .font(.system(size: 16))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.green, lineWidth: 2)
                    ).padding(.bottom, 8).onTapGesture {
                        self.signup()
                    }
                HStack {
                    Text("Already have an account?").foregroundColor(blueGray)
                    Text("Log in").underline().foregroundColor(.green).onTapGesture {
                        self.showLogin.toggle()
                    }.sheet(isPresented: $showLogin){
                        LoginView(showLogin: self.$showLogin)
                    }
                }.font(.system(size: 13.5))
                Spacer().padding(10)
                Text("Skip").font(.system(size: 14, weight: .medium)).frame(maxWidth: .infinity, alignment: .trailing).onTapGesture {
                    self.account.showApp = true
                }
                
            }.padding(EdgeInsets(top: 10, leading: 25, bottom: 25, trailing: 25))
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
