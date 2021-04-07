//
//  MessagesRow.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 12/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

//struct MessagesRow: View {
//    var message: MessageModel
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 8) {
//            HStack {
//                if !message.read {
//                    Circle().fill(Color.green).frame(width: 10, height: 10)
//                }
//                Text(message.sender).fontWeight(message.read ? .regular : .semibold)
//                Spacer()
//                Text(message.threads[0].date).foregroundColor(message.read ? Color.gray : Color.black).font(.system(size: 12))
//            }
//            Text(message.threads[0].text).fontWeight(message.read ? .regular : .medium)
//                .foregroundColor(message.read ? Color.gray  : Color.black)
//                .font(.system(size: 15)).lineLimit(1)
//        }.padding(EdgeInsets(top: 18, leading: 0, bottom: 18, trailing: 0))
//    }
//}

//struct MessagesRow_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            MessagesRow(message: messagesData[0])
//        }
//        .previewLayout(.fixed(width: 300, height: 70))
//    }
//}
