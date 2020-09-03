//
//  MessagesRow.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 12/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct MessagesRow: View {
    
    var message: MessagesModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                if message.unread {
                    Circle().fill(Color.green).frame(width: 10, height: 10)
                }
                Text(message.sender).fontWeight(message.unread ? .semibold : .regular)
                Spacer()
                Text(message.date).foregroundColor(message.unread ? Color.black : Color.gray).font(.system(size: 12))
            }
            //Text(message.message.prefix(37) + "...").fontWeight(message.unread ? .medium :
            Text(message.message).fontWeight(message.unread ? .medium :.regular).foregroundColor(message.unread ? Color.black : Color.gray).font(.system(size: 15)).lineLimit(1)
        }.padding(EdgeInsets(top: 18, leading: 0, bottom: 18, trailing: 0))
    }
}

struct MessagesRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MessagesRow(message: messagesData[0])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
