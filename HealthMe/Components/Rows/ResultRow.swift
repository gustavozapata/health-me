//
//  ResultRow.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 01/09/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct ResultRow: View {
    
    var result: ResultsModel
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        Text(result.test).bold()
                        Spacer()
                        Text(result.date).font(.system(size: 12)).foregroundColor(Color.secondary).padding(.trailing)
                    }
                    HStack {
                        Image(systemName: "checkmark.circle.fill").foregroundColor(Color.green)
                        Text("cholesterol: \(result.cholesterolLevel)").font(.system(size: 14))
                    }
                }
                Spacer()
                Image(systemName: "chevron.right").font(.system(size: 12))
            }.padding().frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading).background(Color.white)
            Divider().padding(.leading)
        }
    }
}

//struct ResultRow_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultRow(result: resultsData[0])
//    }
//}
