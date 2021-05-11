//
//  BloodCells.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 02/05/2021.
//  Copyright © 2021 Gustavo Zapata. All rights reserved.
//

import SwiftUI
import AVKit

struct BloodCells: View {
    @State var showRedCellsInfo = false
    @State var showWhiteCellsInfo = false
    @State var showVideo = false
    var result: ResultsModel
    
    var body: some View {
        VStack {
            Text("Blood Cells").font(.system(size: 25, weight: .semibold))
            VStack {
                Text("Red blood cells").font(.system(size: 18, weight: .semibold))
                HStack{
                    Image("bloodcells").resizable().frame(width: 70, height: 60).padding()
                    Text("\(result.red_blood_cells)").font(.system(size: 45, weight: .semibold))
                }
                Image(systemName: "info.circle").foregroundColor(.blue).onTapGesture {
                    withAnimation {
                        showRedCellsInfo.toggle()
                    }
                }
                if showRedCellsInfo {
                    Text("The normal reference range for the number of red blood cells is between 5 million and 6 million per microlitre for a man, but for woman, it's between 4 million and 5 million").foregroundColor(.gray).font(.system(size: 13.5, weight: .medium)).padding(.top, 10)
                }
            }.fixedSize(horizontal: false, vertical: true).padding()
            
            VStack {
                Text("White blood cells").font(.system(size: 18, weight: .semibold))
                Text("\(result.whiteBloodCells)").font(.system(size: 45, weight: .semibold))
                HStack {
                    Image(systemName: "info.circle").foregroundColor(.blue)
                }.onTapGesture {
                    withAnimation {
                        showWhiteCellsInfo.toggle()
                    }
                }.padding(15)
                if showWhiteCellsInfo {
                    Text("The ]").foregroundColor(.gray).font(.system(size: 13.5, weight: .medium)).padding(.top, 10)
                }
            }.padding(.vertical, 20)
            
            VStack {
                Text("Plateles").font(.system(size: 18, weight: .semibold))
                Text("\(result.whiteBloodCells)").font(.system(size: 45, weight: .semibold))
            }.padding(.vertical, 20)
            
            HStack {
                Image(systemName: "livephoto.play").foregroundColor(.green)
                Text(showVideo ? "Hide video" : "Watch video").font(.system(size: 14, weight: .medium)).foregroundColor(.green)
            }.onTapGesture {
                withAnimation {
                    showVideo.toggle()
                }
            }
            if showVideo {
                VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "bloodcells", withExtension: "mp4")!))
                    .frame(height: 211).transition(.scale)
            }
        }
    }
}

struct BloodCells_Previews: PreviewProvider {
    static var previews: some View {
        BloodCells(result: ResultsModel(blood_type: "B+", test: "Full Blood Count", date: Date(), red_blood_cells: 2000, whiteBloodCells: 2400, cholesterolLevel: 100, glucose_level: 200, hemoglobin: 90, plateletCount: 90))
    }
}
