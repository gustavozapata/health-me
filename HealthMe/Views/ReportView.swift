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
                VStack{
                    Image("bloodtype").font(.system(size: 60)).padding()
                    Text("Your blood type is \(result.blood_type) and it’s in \(bloodTypeInfo(result.blood_type).percentage)% of people in the world, one of the \(bloodTypeInfo(result.blood_type).common) common blood groups").fontWeight(.medium).multilineTextAlignment(.center).fixedSize(horizontal: false, vertical: true)
                }.padding(.vertical, 25).frame(width: 270)
                
                HStack {
                    VStack {
                        Image("vessel").resizable().frame(width: 80, height: 80).padding()
                        Text("The blood vessels are the components of the circulatory system that transport blood throughout the human body").fontWeight(.medium).multilineTextAlignment(.leading).fixedSize(horizontal: false, vertical: true)
                    }.padding().frame(width: 270)
                    Spacer()
                }.padding(.vertical, 20)
                
                Cholesterol(result: result)
                
                Glucose(result: result)
                
                BloodCells(result: result)
                //Sources: https://www.walkinlab.com/blog/how-to-read-your-wellness-blood-test-results/
                //https://ada.com/blood-test-results
            }
        }.navigationBarHidden(true).navigationTitle("")
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView(result: ResultsModel(blood_type: "B+", test: "Full Blood Count", date: Date(), red_blood_cells: 2000, whiteBloodCells: 2400, cholesterolLevel: 100, glucose_level: 200, hemoglobin: 90, plateletCount: 90))
    }
}
