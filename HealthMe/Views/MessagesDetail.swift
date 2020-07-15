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
                            Text(mensaje.missa)
                                .padding(10)
                                .foregroundColor(Color.white).messagesOptions()
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
