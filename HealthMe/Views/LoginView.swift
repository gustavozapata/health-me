//
//  LoginView.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 04/01/2021.
//  Copyright © 2021 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @Binding var showLogin: Bool
    
    var body: some View {
        ScrollView{
            VStack{
                VStack(alignment: .leading){
                    Header(title: "Log in", subtitle: "Access your account")
                    
                    VStack(alignment: .leading){
                        Text("Email").font(.system(size: 14)).fontWeight(.semibold).foregroundColor(blueGray)
                        TextField("user@email.com", text: $email)
                            .padding(10)
                            .cornerRadius(50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                    }.padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
                    
                    VStack(alignment: .leading){
                        Text("Password").font(.system(size: 14)).fontWeight(.semibold).foregroundColor(blueGray)
                        SecureField("6+ characters", text: $password)
                            .padding(10)
                            .cornerRadius(50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                    }.padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
                }
                Text("Log in").fontWeight(.medium).padding(EdgeInsets(top: 9, leading: 20, bottom: 9, trailing: 20))
                    .font(.system(size: 16))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.green, lineWidth: 2)
                    ).padding(.bottom, 8)
                HStack {
                    Text("Don't have an account?").foregroundColor(blueGray)
                    Text("Sign up").underline().foregroundColor(.green).onTapGesture {
                        self.showLogin.toggle()
                    }
                }.font(.system(size: 13.5))
            }.padding(.top)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(showLogin: .constant(true))
    }
}
