//
//  Cholesterol.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 02/05/2021.
//  Copyright © 2021 Gustavo Zapata. All rights reserved.
//

import SwiftUI
import AVKit

struct Cholesterol: View {
    @State var showVideo = false
    @State var showInfo = true
    var result: ResultsModel
    
    var body: some View {
        VStack {
            Text("Cholesterol").font(.system(size: 25, weight: .bold))
            Text("This is a type of fat found in your blood").fontWeight(.semibold).padding(6).foregroundColor(.gray)
            ZStack{
                RoundedRectangle(cornerRadius: 50.0).fill(LinearGradient(gradient:Gradient(colors: [.blue, .purple]), startPoint: .leading, endPoint: .trailing)).frame(width: 200, height: 16)
                    .shadow(color: .gray, radius: 3, x: 3, y: 3)
                VStack {
                    Rectangle().fill(Color.orange).frame(width: 6, height: 28).position(x: CGFloat(measureBar(result.cholesterolLevel, min: 100, max: 202)), y: 25.0)
                    Text("\(result.cholesterolLevel)").font(.system(size: 14, weight: .bold)).position(x: CGFloat(measureBar(result.cholesterolLevel, min: 100, max: 202)), y: 24)
                }.frame(width: 200, height: 50)
            }.padding()
            VStack(spacing: 20){
                Text(cholesterolLevel(result.cholesterolLevel)).font(.system(size: 15, weight: .semibold))
                HStack(alignment: .top){
                    Image(systemName: "exclamationmark.triangle.fill").foregroundColor(.orange).font(.system(size: 12))
                    Text("High cholesterol can increase your risk of heart and circulatory diseases such as heart attack and stroke").font(.system(size: 13, weight: .medium)).foregroundColor(Color.gray)
                }
            }.fixedSize(horizontal: false, vertical: true)
            
            HStack {
                Image(systemName: "info.circle").foregroundColor(.blue)
            }.onTapGesture {
                withAnimation {
                    showInfo.toggle()
                    showVideo = false
                }
            }.padding(15)
            if showInfo {
                Text("The normal range for overall cholesterol is less than 200 mg/dL. High total cholesterol is 240 mg/dL and above and is considered risky. And borderline high risk is in a range of 200-239 mg/dL").foregroundColor(.gray).font(.system(size: 13.5, weight: .medium)).padding(15).lineLimit(nil)
            }
            
            HStack {
                Image(systemName: "livephoto.play").foregroundColor(.green)
                Text(showVideo ? "Hide video" : "Watch video").font(.system(size: 14, weight: .medium)).foregroundColor(.green)
            }.onTapGesture {
                withAnimation {
                    showVideo.toggle()
                    showInfo = false
                }
            }
            if showVideo {
                VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "cholesterol", withExtension: "mp4")!))
                    .frame(height: 193).transition(.scale)
            }
        }.padding()
    }
}

struct Cholesterol_Previews: PreviewProvider {
    static var previews: some View {
        Cholesterol(result: ResultsModel(blood_type: "B+", test: "Full Blood Count", date: Date(), red_blood_cells: 5.7, whiteBloodCells: 4500, cholesterolLevel: 300, glucose_level: 200, plateletCount: 90))
    }
}
