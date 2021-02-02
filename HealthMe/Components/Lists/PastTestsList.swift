//
//  PastTestsList.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 18/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct PastTestsList: View {
    @ObservedObject var account: AccountViewModel = .account
    
    var body: some View {
        VStack{
            List {
                ForEach(account.userModel!.bookings, id: \.self){ test in
                    NavigationLink(destination: BloodTestInfo(test: test)){
                        PastTestRow(pastTest: test)
                    }
                }
            }.frame(height: CGFloat(account.userModel!.bookings.count) * CGFloat(95))
        }
    }
}

struct PastTestsList_Previews: PreviewProvider {
    static var previews: some View {
        PastTestsList()
    }
}
