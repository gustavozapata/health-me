//
//  BloodCells.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 02/05/2021.
//  Copyright © 2021 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct BloodCells: View {
    @State var showRedCellsInfo = true
    var result: ResultsModel
    
    var body: some View {
        VStack {
            VStack {
                Text("Red blood cells").font(.system(size: 20, weight: .semibold))
                HStack{
                    Image("bloodcells").resizable().frame(width: 70, height: 60).padding()
                    Text("\(result.red_blood_cells)").font(.system(size: 45, weight: .semibold))
                }
                HStack {
                    Image(systemName: "info.circle").foregroundColor(.blue)
                    Text("More info").font(.system(size: 14, weight: .medium)).foregroundColor(.blue)
                }.onTapGesture {
                    withAnimation {
                        showRedCellsInfo.toggle()
                    }
                }
                if showRedCellsInfo {
                    Text("The normal reference range for the number of red blood cells is between 5 million and 6 million per microlitre for a man, but for woman, it's between 4 million and 5 million").foregroundColor(.gray).font(.system(size: 13.5, weight: .medium)).padding(.top, 10)
                }
            }.fixedSize(horizontal: false, vertical: true).padding()
            
            VStack {
                Text("White blood cells").font(.system(size: 20, weight: .semibold))
                Text("\(result.whiteBloodCells)").font(.system(size: 45, weight: .semibold))
            }.padding(.vertical, 20)
        }
    }
}

struct BloodCells_Previews: PreviewProvider {
    static var previews: some View {
        BloodCells(result: ResultsModel(blood_type: "B+", test: "Full Blood Count", date: Date(), red_blood_cells: 2000, whiteBloodCells: 2400, cholesterolLevel: 100, glucose_level: 200, hemoglobin: 90, plateletCount: 90))
    }
}
