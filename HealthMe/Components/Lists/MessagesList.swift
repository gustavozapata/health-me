//
//  MessagesList.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 12/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct MessagesList: View {
    @ObservedObject var account: AccountViewModel = .account
    @State var active = true
    
    var body: some View {
        if account.isLogged {
            if account.userModel!.messages.count > 0 {
                MessagesDetail(message: account.userModel!.messages[0])
            } else {
                Text("You don't have any messages").fontWeight(.semibold).foregroundColor(.gray)
            }
        } else {
            Text("Register or login to see your messages").fontWeight(.semibold).foregroundColor(.gray)
        }
    }
}

struct MessagesList_Previews: PreviewProvider {
    static var previews: some View {
        MessagesList()
    }
}
