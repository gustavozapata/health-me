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
    
    var body: some View {
        if account.isLogged {
            if account.userModel!.bookings.count > 0 {
                List {
                    ForEach(account.userModel!.messages, id: \.self){ message in
                        NavigationLink(
                            destination: MessagesDetail(message: message)
                        ){
                            MessagesRow(message: message)
                        }.isDetailLink(false)
                    }
                }
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
