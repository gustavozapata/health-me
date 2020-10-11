//
//  MessagesView.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 12/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct MessagesView: View {
    var message: MessagesData
    
    var body: some View {
        NavigationView {
            MessagesList(messageData: MessagesData())
                .navigationBarTitle("Messages")
        }
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView(message: MessagesData())
    }
}
