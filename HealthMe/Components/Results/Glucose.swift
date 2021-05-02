//
//  Glucose.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 02/05/2021.
//  Copyright © 2021 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct Glucose: View {
    var result: ResultsModel
    
    var body: some View {
        VStack {
            Text("Glucose").font(.system(size: 20, weight: .bold))
            ZStack{
                RoundedRectangle(cornerRadius: 50.0).fill(LinearGradient(gradient:Gradient(colors: [.green, .yellow]), startPoint: .leading, endPoint: .trailing)).frame(width: 200, height: 16)
                    .shadow(color: .gray, radius: 3, x: 3, y: 3)
                VStack {
                    Rectangle().fill(Color.orange).frame(width: 6, height: 28).position(x: CGFloat(result.glucose_level-40), y: 25.0)
                    Text("\(result.glucose_level)").font(.system(size: 14, weight: .bold)).position(x: CGFloat(result.glucose_level-40), y: 24)
                    
                }.frame(width: 200, height: 50)
            }.padding()
            VStack(alignment: .leading, spacing: 10){
                Text("Normal blood sugar levels are as follows: Between 4.0 to 5.4 mmol/L (72 to 99 mg/dL) when fasting").font(.system(size: 15, weight: .semibold))
                HStack(alignment: .top){
                    Image(systemName: "exclamationmark.triangle.fill").foregroundColor(.orange).font(.system(size: 12))
                    Text("Hyperglycemia").font(.system(size: 13, weight: .medium)).foregroundColor(Color.gray)
                }
            }.fixedSize(horizontal: false, vertical: true)
        }.padding()
    }
}

struct Glucose_Previews: PreviewProvider {
    static var previews: some View {
        Glucose(result: ResultsModel(blood_type: "B+", test: "Full Blood Count", date: Date(), red_blood_cells: 2000, whiteBloodCells: 2400, cholesterolLevel: 100, glucose_level: 200, hemoglobin: 90, plateletCount: 90))
    }
}
