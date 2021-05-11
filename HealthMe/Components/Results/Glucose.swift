//
//  Glucose.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 02/05/2021.
//  Copyright © 2021 Gustavo Zapata. All rights reserved.
//

import SwiftUI
import AVKit

struct Glucose: View {
    @State var showVideo = false
    @State var showInfo = false
    var result: ResultsModel
    
    var body: some View {
        VStack {
            Text("Glucose").font(.system(size: 25, weight: .bold))
            Text("This is the amount of sugar in your blood").padding(6).foregroundColor(.gray)
            ZStack{
                RoundedRectangle(cornerRadius: 50.0).fill(LinearGradient(gradient:Gradient(colors: [.green, .yellow]), startPoint: .leading, endPoint: .trailing)).frame(width: 200, height: 16)
                    .shadow(color: .gray, radius: 3, x: 3, y: 3)
                VStack {
                    Rectangle().fill(Color.orange).frame(width: 6, height: 28).position(x: CGFloat(measureBar(result.glucose_level, min: 70, max: 185)), y: 25.0)
                    Text("\(result.glucose_level)").font(.system(size: 14, weight: .bold)).position(x: CGFloat(measureBar(result.glucose_level, min: 70, max: 185)), y: 24)
                    
                }.frame(width: 200, height: 50)
            }.padding()
            VStack(alignment: .leading, spacing: 10){
                Text(glucoseLevels(result.glucose_level)).font(.system(size: 15, weight: .semibold))
            }.fixedSize(horizontal: false, vertical: true)
            
            HStack {
                Image(systemName: "info.circle").foregroundColor(.blue)
            }.onTapGesture {
                withAnimation {
                    showInfo.toggle()
                }
            }.padding(15)
            if showInfo {
                Text("A blood sugar level less than 140 mg/dL is normal. A reading of more than 200 mg/dL indicates diabetes. A reading between 140 and 199 mg/dL indicates prediabetes. The standard for measuring blood glucose is 'mg/dL' which means milligrams per deciliter").foregroundColor(.gray).font(.system(size: 13.5, weight: .medium)).padding(.top, 10)
            }
            
            HStack {
                Image(systemName: "livephoto.play").foregroundColor(.green)
                Text(showVideo ? "Hide video" : "Watch video").font(.system(size: 14, weight: .medium)).foregroundColor(.green)
            }.onTapGesture {
                withAnimation {
                    showVideo.toggle()
                }
            }
            if showVideo {
                VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "glucose", withExtension: "mp4")!))
                    .frame(height: 211).transition(.scale)
            }
        }.padding()
    }
}

struct Glucose_Previews: PreviewProvider {
    static var previews: some View {
        Glucose(result: ResultsModel(blood_type: "B+", test: "Full Blood Count", date: Date(), red_blood_cells: 4.8, whiteBloodCells: 499, cholesterolLevel: 100, glucose_level: 300, plateletCount: 90))
    }
}
