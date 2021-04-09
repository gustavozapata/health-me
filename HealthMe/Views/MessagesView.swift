//
//  MessagesView.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 12/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct MessagesView: View {
    
    @ObservedObject var account: AccountViewModel = .account
    @State var active = true
    
    var body: some View {
        NavigationView {
            if account.isLogged {
                if account.userModel!.messages.count > 0 {
                    MessagesDetail(messages: account.userModel!.messages)
                } else {
                    Text("You don't have any messages").fontWeight(.semibold).foregroundColor(.gray)
                }
            } else {
                Text("Register or login to see your messages").fontWeight(.semibold).foregroundColor(.gray).navigationBarTitle("Messages")
            }
        }
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView().preferredColorScheme(.dark)
    }
}
