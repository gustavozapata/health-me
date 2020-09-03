//
//  BloodResultCard.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 01/09/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct BloodResultCard: View {
    
    var result: ResultModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(result.name).bold()
            
            HStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(result.summary, id: \.self){ value in
                        HStack {
                            Image(systemName: "checkmark.circle.fill").foregroundColor(Color.green).font(.system(size: 14))
                            Text(value).font(.system(size: 12))
                        }
                    }
                    //                    HStack {
                    //                        Image(systemName: "checkmark.circle.fill").foregroundColor(Color.green).font(.system(size: 14))
                    //                        Text("Cholesterol").font(.system(size: 12))
                    //                    }
                    //                    HStack {
                    //                        Image(systemName: "checkmark.circle.fill").foregroundColor(Color.green).font(.system(size: 14))
                    //                        Text("Sugar").font(.system(size: 12))
                    //                    }
                    //                    HStack {
                    //                        Image(systemName: "checkmark.circle.fill").foregroundColor(Color.green).font(.system(size: 14))
                    //                        Text("Pressure").font(.system(size: 12))
                    //                    }
                }
                Spacer()
                VStack {
                    //                    Image("bloodtube").resizable().aspectRatio(contentMode: .fit).frame(height: 50)
                    Image(systemName: "doc").font(.system(size: 33)).padding(.bottom, 15)
                    Text(result.date).font(.system(size: 13))
                }
            }.padding(.vertical, 5)
            
            Image("barcode").resizable().aspectRatio(contentMode: .fit)
            //            Image(systemName: "barcode.viewfinder").font(.system(size: 30))
            
        }.padding().background(Color(red: 247/255, green: 247/255, blue: 247/255)).cornerRadius(22).clipped().shadow(color: Color(red: 200/255, green: 200/255, blue: 200/255), radius: 7, x: 0, y: 2).frame(width: 280)
    }
}

struct BloodResultCard_Previews: PreviewProvider {
    static var previews: some View {
        BloodResultCard(result: resultsData[0])
    }
}
