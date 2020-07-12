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
                Text(message.sender).font(.system(size: 20))
                Spacer()
                Text(message.date).foregroundColor(Color.gray).font(.system(size: 13))
            }
            Text(message.message.prefix(37) + "...").foregroundColor(.gray)
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
