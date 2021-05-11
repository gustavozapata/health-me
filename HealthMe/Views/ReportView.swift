//
//  ReportView.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 01/09/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI
import AVKit

struct ReportView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var result: ResultsModel
    
    var backButton : some View {
        Image(systemName: "arrow.left").font(.system(size: 30, weight: .bold)).foregroundColor(Color.green).padding(.leading).onTapGesture {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                backButton
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(result.test).font(.system(size: 25, weight: .bold)).fixedSize(horizontal: false, vertical: true)
                    Text(dateToString(date: result.date, format: "text")).bold().font(.system(size: 16)).fixedSize(horizontal: false, vertical: true).foregroundColor(Color.green)
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 70, alignment: .topLeading).padding()
            }.padding(.top, 5)
            
            //Report
            VStack {
                BloodType(result: result).padding(.vertical, 40)
                
                Cholesterol(result: result).padding(.vertical, 40)
                
                Glucose(result: result).padding(.vertical, 40)
                
                BloodCells(result: result).padding(.vertical, 40)
            }
        }.navigationBarHidden(true).navigationTitle("")
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView(result: ResultsModel(blood_type: "O+", test: "Full Blood Count", date: Date(), red_blood_cells: 2.8, whiteBloodCells: 48, cholesterolLevel: 100, glucose_level: 200, plateletCount: 90))
    }
}
