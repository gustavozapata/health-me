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
    @State var showPlateletsInfo = false
    @State var showVideo = false
    var result: ResultsModel
    
    var body: some View {
        VStack {
            Text("Blood Cells").font(.system(size: 25, weight: .semibold))
            VStack {
                Text("Red blood cells").font(.system(size: 20, weight: .semibold))
                Text("These cells carry oxigen").padding(6).foregroundColor(.gray)
                HStack{
                    Image("bloodcells").resizable().frame(width: 70, height: 60).padding()
                    Text("\(String(format: "%.1f", result.red_blood_cells)) million").font(.system(size: 45, weight: .semibold))
                }
                Text("\(String(format: "%.1f", result.red_blood_cells)) million cells per microlitre of blood").foregroundColor(.gray)
                Text(redBloodCells(result.red_blood_cells))
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
                Text("White blood cells").font(.system(size: 20, weight: .semibold))
                Text("These cells fight infection").padding(6).foregroundColor(.gray)
                Text("\(result.whiteBloodCells)").font(.system(size: 45, weight: .semibold))
                HStack {
                    Image(systemName: "info.circle").foregroundColor(.blue)
                }.onTapGesture {
                    withAnimation {
                        showWhiteCellsInfo.toggle()
                    }
                }.padding(15)
                if showWhiteCellsInfo {
                    Text("A low white blood cell count usually means your body is not making enough white blood cells. It can increase your risk of getting infections. A high white blood cell count may indicate that the immune system is working to destroy an infection.").foregroundColor(.gray).font(.system(size: 13.5, weight: .medium)).padding(10).frame(width: 300)
                }
            }.padding(.vertical, 20)
            
            VStack {
                Text("Plateles").font(.system(size: 20, weight: .semibold))
                Text("These cells help with blood clotting").padding(6).foregroundColor(.gray)
                Text("\(result.plateletCount)").font(.system(size: 45, weight: .semibold))
                HStack {
                    Image(systemName: "info.circle").foregroundColor(.blue)
                }.onTapGesture {
                    withAnimation {
                        showPlateletsInfo.toggle()
                        showVideo = false
                    }
                }.padding(15)
                if showPlateletsInfo {
                    Text("A normal platelet count ranges from 150,000 to 450,000 platelets per microliter of blood. Having more than 450,000 platelets is a condition called thrombocytosis. Having less than 150,000 is known as thrombocytopenia").foregroundColor(.gray).font(.system(size: 13.5, weight: .medium)).padding(10).frame(width: 300)
                }
            }.padding(.vertical, 20)
            
            HStack {
                Image(systemName: "livephoto.play").foregroundColor(.green)
                Text(showVideo ? "Hide video" : "Watch video").font(.system(size: 14, weight: .medium)).foregroundColor(.green)
            }.onTapGesture {
                withAnimation {
                    showVideo.toggle()
                    showPlateletsInfo = false
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
        BloodCells(result: ResultsModel(blood_type: "B+", test: "Full Blood Count", date: Date(), red_blood_cells: 2.6, whiteBloodCells: 52, cholesterolLevel: 100, glucose_level: 200, plateletCount: 90))
    }
}
