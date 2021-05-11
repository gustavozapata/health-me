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
    var result: ResultsModel
    
    var body: some View {
        VStack {
            Text("Cholesterol").font(.system(size: 25, weight: .bold))
            ZStack{
                RoundedRectangle(cornerRadius: 50.0).fill(LinearGradient(gradient:Gradient(colors: [.blue, .purple]), startPoint: .leading, endPoint: .trailing)).frame(width: 200, height: 16)
                    .shadow(color: .gray, radius: 3, x: 3, y: 3)
                //RoundedRectangle(cornerRadius: 25)
                VStack {
                    Rectangle().fill(Color.orange).frame(width: 6, height: 28).position(x: CGFloat(result.cholesterolLevel-40), y: 25.0)
                    //.shadow(color: .gray, radius: 4, x: 2, y: 2)
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
            
            HStack {
                Image(systemName: "livephoto.play").foregroundColor(.green)
                Text(showVideo ? "Hide video" : "Watch video").font(.system(size: 14, weight: .medium)).foregroundColor(.green)
            }.onTapGesture {
                withAnimation {
                    showVideo.toggle()
                }
            }
            Text("If the level is higher than 260, this could potentially bring problems to yourlungs and heart")
            if showVideo {
                VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "cholesterol", withExtension: "mp4")!))
                    .frame(height: 193).transition(.scale)
            }
        }.padding()
    }
}

struct Cholesterol_Previews: PreviewProvider {
    static var previews: some View {
        Cholesterol(result: ResultsModel(blood_type: "B+", test: "Full Blood Count", date: Date(), red_blood_cells: 2000, whiteBloodCells: 2400, cholesterolLevel: 100, glucose_level: 200, hemoglobin: 90, plateletCount: 90))
    }
}
