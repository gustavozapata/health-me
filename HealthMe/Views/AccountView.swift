//
//  AccountView.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 10/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct AccountView: View {
    @State private var loggingOut = false
    @State var isEdit = false
    
    @ObservedObject var account: AccountViewModel = .account
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Text("Edit").foregroundColor(Color.green).fontWeight(.bold).underline()
                        .onTapGesture {
                            self.isEdit = true
                        }
                }.offset(y: 20)
                VStack(alignment: .leading, spacing: 5) {
                    Text("Name").fontWeight(.bold)
                    Text(account.userModel!.fullname)
                }.padding(.bottom, 30)
                VStack(alignment: .leading, spacing: 5) {
                    Text("Email").fontWeight(.bold)
                    Text(account.userModel!.email)
                }.padding(.bottom, 30)
                
            }.padding().frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            Text("Log out").bold().foregroundColor(Color.gray).padding(.top, 40).onTapGesture{
                self.loggingOut.toggle()
            }.alert(isPresented: $loggingOut) {
                Alert(title: Text("Log out"), message: Text("Are you sure you want to log out?"), primaryButton: .destructive(Text("Yes")) {
                    account.logout()
                }, secondaryButton: .cancel(Text("No")))
            }
        }.sheet(isPresented: $isEdit){
            EditDetailsView(isEdit: $isEdit)
        }
        .navigationBarTitle("Account")
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
