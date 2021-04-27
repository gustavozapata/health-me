//
//  EditDetailsView.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 26/04/2021.
//  Copyright © 2021 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct EditDetailsView: View {
    @ObservedObject var account: AccountViewModel = .account
    @Binding var isEdit: Bool
    @State var fullname: String = ""
    @State var email: String = ""
    @State var isValidEmail = false
    
    func validateEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailMatch = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailMatch.evaluate(with: email)
    }
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Spacer()
                    Text("Cancel").font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.gray).underline().padding()
                        .onTapGesture {
                            self.isEdit = false
                        }
                }
                Header(title: "Edit Details", subtitle: "Edit your personal details").padding(.bottom)
                
                VStack(alignment: .leading){
                    Text("Full Name").font(.system(size: 14)).fontWeight(.semibold).foregroundColor(.green)
                    
                    TextField("John Doe", text: $fullname)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .padding(10)
                        .cornerRadius(50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                }.padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
                
                VStack(alignment: .leading){
                    Text("Email").font(.system(size: 14)).fontWeight(.semibold).foregroundColor(.green)
                    
                    TextField("user@email.com", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .padding(10)
                        .cornerRadius(50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                }.padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
                
                Text("Update").fontWeight(.medium).padding(EdgeInsets(top: 9, leading: 20, bottom: 9, trailing: 20))
                    .font(.system(size: 16))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.green, lineWidth: 2)
                    ).padding(.bottom, 8).onTapGesture {
                        if validateEmail(email: email) {
                            account.updateDetails(fullname, email) {
                                self.isEdit = false
                            }
                        } else {
                            self.isValidEmail.toggle()
                        }
                    }
            }.alert(isPresented: $isValidEmail) {
                Alert(title: Text("Valid Email"), message: Text("Please enter a valid email"), dismissButton: .default(Text("OK")))
            }
        }.padding(.vertical).onAppear(){
            self.fullname = account.userModel!.fullname
            self.email = account.userModel!.email
        }
    }
}

struct EditDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        EditDetailsView(isEdit: .constant(true))
    }
}
