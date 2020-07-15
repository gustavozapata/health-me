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
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Spacer()
                VStack(alignment: .center) {
                    Text("You haven't confirmed your email").foregroundColor(Color.white).padding().font(.system(size: 16, weight: .bold)).frame(width: 300, height: 35, alignment: .center)
                    }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center).background(Color.green)
                Group {
                    ForEach(accountDetails, id: \.self){ accountDetail in
                        VStack {
                            Text(accountDetail.field).font(.system(size: 16, weight: .bold)).frame(width: 350, height: 20, alignment: .topLeading)
                            Text(accountDetail.value).font(.system(size: 20, weight: .regular)).frame(width: 350, height: 30, alignment: .topLeading).lineLimit(nil).fixedSize()
                        }
                    }
                    .padding(.all)
                }
                //                Spacer()
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
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
            Account(field: "Telephone", value: "074745599233373737377373737737373"),
            Account(field: "Telephone", value: "07474559923"),
            Account(field: "Telephone", value: "07474559923"),
            Account(field: "Telephone", value: "07474559923"),
            Account(field: "Telephone", value: "07474559923"),
            Account(field: "Telephone", value: "07474559923"),
            Account(field: "Telephone", value: "07474559923"),
            Account(field: "Telephone", value: "07474559923"),
            Account(field: "Telephone", value: "07474559923")
        ]
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
