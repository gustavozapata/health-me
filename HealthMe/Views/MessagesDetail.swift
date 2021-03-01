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
    var message: MessageModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .trailing){
                ForEach(message.threads, id: \.self){ msg in
                    VStack{
                        if msg.user {
                            HStack {
                                Spacer()
                                VStack(alignment: .trailing, spacing: 10) {
                                    Text(msg.text)
                                        .padding(10)
                                        .foregroundColor(Color.white).messagesOptions()
                                    Text(msg.time).foregroundColor(Color.gray).font(.system(size: 12)).padding(.trailing, 10)
                                }
                            }
                        } else {
                            VStack(alignment: .leading, spacing: 10) {
                                Text(message.sender).foregroundColor(Color.gray).font(.system(size: 12))
                                Text(msg.text).padding().background(Color(red: 246/255, green: 248/255, blue: 250/255)).cornerRadius(16).lineSpacing(5)
                                Text(msg.time).foregroundColor(Color.gray).font(.system(size: 12))
                                if msg == message.threads.last {
                                    VStack(alignment: .leading) {
                                        ForEach(msg.options, id: \.self) { reply in
                                            Text(reply).padding(8).overlay(
                                                RoundedRectangle(cornerRadius: 25)
                                                    .stroke(Color.black, lineWidth: 1.5)).onTapGesture {
                                                        print(reply)
                                                        account.sendMessage(reply, message.sender) {
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
        }.navigationBarTitle(message.sender)
    }
}

extension View {
    func messagesOptions() -> some View {
        return self.modifier(MessagesOptions())
    }
}

struct MessagesDetail_Previews: PreviewProvider {
    static var previews: some View {
        return MessagesDetail(message: MessageModel(sender: "Health Me", read: false, threads: [ThreadModel(date: "23 Jan, 2020", time: "12:00PM", text: "Thanks for joining us", user: false, options: ["You're welcome"])]))
    }
}
