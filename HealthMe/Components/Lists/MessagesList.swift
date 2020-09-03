//
//  MessagesList.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 12/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct MessagesList: View {
    
    var messageData: MessagesData
    
    var body: some View {
        List {
            ForEach(messagesData){message in
                NavigationLink(
                    destination: MessagesDetail(message: message)
                ){
                    MessagesRow(message: message)
                }.isDetailLink(false)
            }
        }
    }
}

struct MessagesList_Previews: PreviewProvider {
    static var previews: some View {
        MessagesList(messageData: MessagesData())
    }
}
