//
//  AccountView.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 10/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct AccountView: View {
    let accountDetails = Account.all()
    @State private var loggingOut = false
    
    @ObservedObject var account: AccountViewModel = .account
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Text("Edit").foregroundColor(Color.green).fontWeight(.bold).underline()
                }.offset(y: 20)
                ForEach(accountDetails, id: \.self){ accountDetail in
                    VStack(alignment: .leading, spacing: 5) {
                        Text(accountDetail.field).fontWeight(.bold)
                        Text(accountDetail.value)
                    }.padding(.bottom, 30)
                }
            }.padding().frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            
            Text("Log out").bold().foregroundColor(Color.gray).padding().onTapGesture{
                self.loggingOut.toggle()
            }.alert(isPresented: $loggingOut) {
                Alert(title: Text("Log out"), message: Text("Are you sure you want to log out?"), primaryButton: .destructive(Text("Yes")) {
                    account.logout()
                    }, secondaryButton: .cancel(Text("No")))
            }
            Text("Delete account").bold().foregroundColor(Color.gray).padding()
        }
        .navigationBarTitle("Account")
    }
}

struct Account {
    let field: String
    let value: String
}
extension Account: Hashable {
    static func all() -> [Account] {
        return [
            Account(field: "Name", value: "Gustavo Zapata"),
            Account(field: "Email", value: "tavo@hotmail.com"),
            Account(field: "Telephone", value: "07474559923"),
        ]
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
