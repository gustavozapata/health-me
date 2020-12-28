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
                TextField("Full Name", text: $fullname)
                    .padding(10)
                    .cornerRadius(50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding(.bottom, 20)
                TextField("Telephone", text: $telephone)
                    .padding(10)
                    .cornerRadius(50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding(.bottom, 20)
                TextField("Email", text: $email)
                    .padding(10)
                    .cornerRadius(50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding(.bottom, 20)
                SecureField("Password", text: $password)
                    .padding(10)
                    .cornerRadius(50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding(.bottom, 20)
                Text("Sign Up")
                
            }.padding(25)
            
        }.navigationBarTitle("Create Account")
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
