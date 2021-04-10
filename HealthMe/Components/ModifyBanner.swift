//
//  ModifyBanner.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 27/12/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct ModifyBanner: View {
    @ObservedObject var account: AccountViewModel = .account
    
    var body: some View {
        VStack(spacing: 2) {
            Text("Modifying").foregroundColor(Color.green).fontWeight(.semibold).font(.system(size: 12))
            HStack(spacing: 16) {
                VStack(alignment: .leading){
                    Text(account.aBooking.location)
                    Text(account.aBooking.address)
//                    Text("KT2 7PS")
                }.font(.system(size: 12))
                VStack {
                    Text("22 Aug")
                    Text("11:00 a.m.")
                }.foregroundColor(Color.gray).font(.system(size: 12))
            }.padding(7).font(.system(size: 12)).overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [5.0]))
                    .fill(Color.green)
            )
        }
    }
}

struct ModifyBanner_Previews: PreviewProvider {
    static var previews: some View {
        ModifyBanner()
    }
}
