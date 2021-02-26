//
//  ResultsList.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 01/09/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct ResultsList: View {
    var type: String
    @ObservedObject var account: AccountViewModel = .account
    
    var body: some View {
        ForEach(account.userModel!.results, id: \.self){ result in
            NavigationLink(destination: ReportView(result: result)){
                VStack {
                    if self.type == "list" {
                        ResultRow(result: result)
                    } else {
                        BloodResultCard(result: result).padding(.vertical, 15)
                    }
                }
            }.buttonStyle(PlainButtonStyle())
        }
    }
}

//struct ResultsList_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultsList(results: ResultData(), type: "list")
//    }
//}
