//
//  SignUpView.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 27/12/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

let lightGrey = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
let lightBorder = Color(red: 211/255, green: 225/255, blue: 230/255)
let blueGray = Color(red: 143/255, green: 157/255, blue: 181/255)

struct SignUpView: View {
    
    @State var fullname: String = ""
    @State var telephone: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    init(fullname: String = "", telephone: String = "", email: String = "", password: String = ""){
        self.fullname = fullname
        self.telephone = telephone
        self.email = email
        self.password = password
    }
    
    var body: some View {
        ScrollView {
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
                        .padding(.bottom, 20)
                }
                Text("Create account").fontWeight(.medium).padding(9)
                    .font(.system(size: 16))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.green, lineWidth: 2)
                    ).padding(.bottom, 8)
                HStack {
                    Text("Have an account?").foregroundColor(blueGray)
                    Text("Log in").underline().foregroundColor(.green)
                }.font(.system(size: 13.5))
            }.padding(25)
        }.navigationBarTitle("Create Account")
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
