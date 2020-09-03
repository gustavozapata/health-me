//
//  MessagesDetail.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 12/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct MessagesDetail: View {
    
    @EnvironmentObject var messagesData: MessagesData
    var message: MessagesModel
    @State var cancel = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .trailing){
                ForEach(message.mensajes, id: \.self){ mensaje in
                    VStack{
                        if(mensaje.sender != "user"){
                            VStack(alignment: .leading, spacing: 10) {
                                Text(mensaje.sender).foregroundColor(Color.gray).font(.system(size: 12))
                                Text(mensaje.missa).padding().background(Color(red: 246/255, green: 248/255, blue: 250/255)).cornerRadius(16).lineSpacing(5)
                                Text(mensaje.fecha).foregroundColor(Color.gray).font(.system(size: 12))
                            }
                        } else {
                            HStack {
                                Spacer()
                                VStack(alignment: .trailing, spacing: 10) {
                                    if mensaje.sent {
                                        Text(mensaje.missa)
                                            .padding(10)
                                            .foregroundColor(Color.white).messagesOptions()
                                        Text(mensaje.fecha).foregroundColor(Color.gray).font(.system(size: 12)).padding(.trailing, 10)
                                        
                                        //Msg action
                                    } else {
                                        Text(mensaje.missa).padding(10).overlay(
                                            RoundedRectangle(cornerRadius: 25)
                                                .stroke(Color.black, lineWidth: 2)
                                        ).onTapGesture {
                                            self.cancel = true
                                        }
                                    }
                                }
                            }
                        }
                    }.padding().frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
                }
                
                Spacer()
                
                //FIXME: MAKE A POST REQUEST HERE
                if self.cancel {
                    VStack(alignment: .leading) {
                        Text("Bllod Station").foregroundColor(Color.gray).font(.system(size: 12))
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

struct MessagesDetail_Previews: PreviewProvider {
    static var previews: some View {
        let messagesData = MessagesData()
        return MessagesDetail(message: messagesData.messages[0])
    }
}
