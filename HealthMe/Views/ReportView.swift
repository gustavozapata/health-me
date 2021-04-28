//
//  ReportView.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 01/09/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

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
                
                //Cholesterol
                VStack {
                    Text("Cholesterol").font(.system(size: 20, weight: .bold))
                    ZStack{
                        RoundedRectangle(cornerRadius: 50.0).fill(LinearGradient(gradient:Gradient(colors: [.blue, .purple]), startPoint: .leading, endPoint: .trailing)).frame(width: 200, height: 16)
                            .shadow(color: .gray, radius: 3, x: 3, y: 3)
                        //                            RoundedRectangle(cornerRadius: 25)
                        VStack {
                            Rectangle().fill(Color.orange).frame(width: 6, height: 28).position(x: CGFloat(result.cholesterolLevel-40), y: 25.0)
                            //                                    .shadow(color: .gray, radius: 4, x: 2, y: 2)
                            Text("\(result.cholesterolLevel)").font(.system(size: 14, weight: .bold)).position(x: CGFloat(result.cholesterolLevel-40), y: 24)
                        }.frame(width: 200, height: 50)
                    }.padding()
                    VStack(alignment: .leading, spacing: 10){
                        Text("Total cholesterol should be less than 200 mg/dL (200 milligrams per decilitre)").font(.system(size: 15, weight: .semibold))
                        HStack(alignment: .top){
                            Image(systemName: "exclamationmark.triangle.fill").foregroundColor(.orange).font(.system(size: 12))
                            Text("High cholesterol levels cause high risk of heart disease").font(.system(size: 13, weight: .medium)).foregroundColor(Color.gray)
                        }
                    }.fixedSize(horizontal: false, vertical: true)
                }.padding()
                
                //Glucose
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
                
                VStack {
                    Text("Red blood cells").font(.system(size: 20, weight: .semibold))
                    HStack{
                        Image("bloodcells").resizable().frame(width: 70, height: 60).padding()
                        Text("\(result.red_blood_cells)").font(.system(size: 45, weight: .semibold))
                    }
                }.padding(.vertical, 20)
                
                VStack {
                    Text("White blood cells").font(.system(size: 20, weight: .semibold))
                    Text("\(result.whiteBloodCells)").font(.system(size: 45, weight: .semibold))
                }.padding(.vertical, 20)
                
                //Sources: https://www.walkinlab.com/blog/how-to-read-your-wellness-blood-test-results/
                //https://ada.com/blood-test-results
                
            }
        }.navigationBarHidden(true)
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView(result: ResultsModel(blood_type: "B+", test: "Full Blood Count", date: Date(), red_blood_cells: 2000, whiteBloodCells: 2400, cholesterolLevel: 100, glucose_level: 200, hemoglobin: 90, plateletCount: 90))
    }
}
