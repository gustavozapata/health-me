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
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Group {
                ForEach(accountDetails, id: \.self){ accountDetail in
                    VStack {
                        Text(accountDetail.field).font(.system(size: 16, weight: .black)).frame(width: 300, height: 20, alignment: .topLeading)
                        Text(accountDetail.value).font(.system(size: 20, weight: .medium)).frame(width: 300, height: 30, alignment: .topLeading)
                    }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                }.padding(.all)
            }
            Spacer()
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
            Account(field: "Name", value: "Gustavo"),
            Account(field: "Email", value: "tavo@hotmail.com"),
            Account(field: "Telephone", value: "07474559923")
        ]
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
