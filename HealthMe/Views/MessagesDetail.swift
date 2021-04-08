//
//  MessagesDetail.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 12/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct MessagesDetail: View {
    
    @ObservedObject var messageVM: MessageViewModel = .message
    @ObservedObject var account: AccountViewModel = .account
    var messages: [MessageModel]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .trailing){
                ForEach(messages, id: \.self){ msg in
                    VStack{
                        if msg.isUser {
                            HStack {
                                Spacer()
                                VStack(alignment: .trailing, spacing: 10) {
                                    Text(msg.text)
                                        .padding(10)
                                        .foregroundColor(Color.white).messagesOptions()
                                    Text(dateToString(date: msg.date, time: msg.time, format: "time")).foregroundColor(Color.gray).font(.system(size: 12)).padding(.trailing, 10)
                                }
                            }
                        } else {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Health Me").foregroundColor(Color.gray).font(.system(size: 12))
                                Text(msg.text).padding().background(Color(red: 246/255, green: 248/255, blue: 250/255)).cornerRadius(16).lineSpacing(5)
                                Text(dateToString(date: msg.date, time: msg.time, format: "time")).foregroundColor(Color.gray).font(.system(size: 12))
                                if msg == messages.last {
                                    VStack(alignment: .leading) {
                                        ForEach(msg.options, id: \.self) { reply in
                                            Text(reply.option).padding(8).overlay(
                                                RoundedRectangle(cornerRadius: 25)
                                                    .stroke(Color.black, lineWidth: 1.5)).onTapGesture {
                                                        account.sendMessage(reply) {
                                                            print("message sent")
                                                        }
                                                    }
                                        }
                                    }.padding(.vertical, 20)
                                }
                            }
                        }
                    }.padding().frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
                }
                Spacer()
            }
        }.navigationBarTitle("Messages")
    }
}

extension View {
    func messagesOptions() -> some View {
        return self.modifier(MessagesOptions())
    }
}

struct MessagesDetail_Previews: PreviewProvider {
    static var previews: some View {
        return MessagesDetail(messages: [MessageModel(date: Date(), time: "12:00", text: "Message", isUser: false, options: [MessageOptionModel(code: 100, option: "Cancel the appointment")])])
    }
}
