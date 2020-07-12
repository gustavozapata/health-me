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
    
    var body: some View {
        VStack(alignment: .trailing){
            ForEach(message.mensajes, id: \.self){ mensaje in
                VStack{
                    if(mensaje.sender != "user"){
                        VStack(alignment: .leading, spacing: 10) {
                            Text(mensaje.missa)
                            Text(mensaje.fecha).foregroundColor(Color.gray).font(.system(size: 14))
                        }
                    } else {
                        VStack(alignment: .trailing, spacing: 10) {
                            
                            VStack{
                                Text(mensaje.missa).foregroundColor(Color.white)
                            }.frame(width: 220, height: 30).background(Color.purple).cornerRadius(20).font(.system(size: 16, weight: .bold))
                            Text(mensaje.fecha).foregroundColor(Color.gray).font(.system(size: 14))
                        }
                    }
                }.padding(20)
            }
            
            Spacer()
                .navigationBarTitle(message.sender)
        }
    }
}

struct MessagesDetail_Previews: PreviewProvider {
    static var previews: some View {
        let messagesData = MessagesData()
        return MessagesDetail(message: messagesData.messages[0]).environmentObject(messagesData)
    }
}
