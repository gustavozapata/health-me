//
//  BloodResultCard.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 01/09/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct BloodResultCard: View {
    
    var result: ResultsModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(result.test).bold()
            
            HStack(alignment: .center) {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Image(systemName: "checkmark.circle.fill").foregroundColor(Color.green).font(.system(size: 14))
                        Text("Cholesterol \(result.cholesterolLevel)").font(.system(size: 12))
                    }
                    HStack {
                        Image(systemName: "checkmark.circle.fill").foregroundColor(Color.green).font(.system(size: 14))
                        Text("Sugar \(result.glucose_level)").font(.system(size: 12))
                    }
                }
                Spacer()
                VStack {
                    //Image("bloodtube").resizable().aspectRatio(contentMode: .fit).frame(height: 50)
                    Image(systemName: "doc").font(.system(size: 33)).padding(.bottom, 15)
                    Text(result.date).font(.system(size: 13))
                }
            }.padding(.vertical, 5)
            
            Image("barcode").resizable().aspectRatio(contentMode: .fit)
            //Image(systemName: "barcode.viewfinder").font(.system(size: 30))
            
        }.padding().background(Color(red: 247/255, green: 247/255, blue: 247/255)).cornerRadius(22).clipped().shadow(color: Color(red: 200/255, green: 200/255, blue: 200/255), radius: 7, x: 0, y: 2).frame(width: 280)
    }
}

struct BloodResultCard_Previews: PreviewProvider {
    static var previews: some View {
        BloodResultCard(result: ResultsModel(blood_type: "B+", test: "Full Blood Count", date: "Jan 27, 2021", red_blood_cells: 2000, whiteBloodCells: 2400, cholesterolLevel: 100, glucose_level: 200, hemoglobin: 90, plateletCount: 90))
    }
}
