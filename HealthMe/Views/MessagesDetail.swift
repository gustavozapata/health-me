//
//  MessagesDetail.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 12/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct MessagesDetail: View {
    
    //    @EnvironmentObject var messagesData: MessagesData
    @ObservedObject var messageVM: MessageViewModel = .message
    @ObservedObject var account: AccountViewModel = .account
    @State var cancel = false
    var message: MessageModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .trailing){
                ForEach(message.threads, id: \.self){ msg in
                    VStack{
                        if(msg.user){
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
                                                        messageVM.sendMessage(reply, message.sender) {
                                                            print("TODO BIEN EN UI")
                                                            //                                                            print(account.userModel as Any)
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
                
                //FIXME: MAKE A POST REQUEST HERE
                if self.cancel {
                    VStack(alignment: .leading) {
                        Text("Blood Station").foregroundColor(Color.gray).font(.system(size: 12))
                        Text("Your appointment has been canceled").padding().background(Color(red: 246/255, green: 248/255, blue: 250/255)).cornerRadius(16).lineSpacing(5)
                        Text("6:00 PM").foregroundColor(Color.gray).font(.system(size: 12))
                    }.position(x: 173, y: 50)
                }
                //FIXME: MAKE A POST REQUEST HERE
                
            }
        }.navigationBarTitle(message.sender)
    }
}

extension View {
    func messagesOptions() -> some View {
        return self.modifier(MessagesOptions())
    }
}

//struct MessagesDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        return MessagesDetail(message: message)
//    }
//}
