//
//  ResultsList.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 01/09/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct ResultsList: View {
    
    var results: ResultData
    var type: String
    
    var body: some View {
        ForEach(results.results){ result in
            NavigationLink(destination: ReportView()){
                if self.type == "list" {
                    ResultRow(result: result)
                } else {
                    BloodResultCard(result: result).padding(.vertical, 15)
                }
            }.buttonStyle(PlainButtonStyle())
        }
    }
}

struct ResultsList_Previews: PreviewProvider {
    static var previews: some View {
        ResultsList(results: ResultData(), type: "list")
    }
}
