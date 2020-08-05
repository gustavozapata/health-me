//
//  StationList.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 04/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct StationList: View {
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Image("station").resizable().aspectRatio(contentMode: .fit).frame(width: 85).padding(.horizontal)
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Kingston").font(.system(size: 18, weight: .bold))
                        Text("32 Richmond road").font(.system(size: 16, weight: .medium))
                        Text("KT2 7PQ").font(.system(size: 16))
                    }.padding(.trailing)
                    Spacer()
                }
            }.frame(width: 320).background(Color.white).cornerRadius(16).shadow(radius: 1, x: 0, y: 1).padding(.bottom, 10)
            
            VStack {
                HStack {
                    Image("station").resizable().aspectRatio(contentMode: .fit).frame(width: 85).padding(.horizontal)
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Surbiton").font(.system(size: 18, weight: .bold)).foregroundColor(Color.white)
                        Text("12 Happy avenue").font(.system(size: 16, weight: .medium)).foregroundColor(Color.white)
                        Text("KT3 4XD").font(.system(size: 16)).foregroundColor(Color.white)
                    }.padding(.trailing)
                    Spacer()
                }
            }.frame(width: 320).background(Color.black).cornerRadius(16).shadow(radius: 1, x: 0, y: 1).border(Color.green).padding(.bottom, 10)
        }
    }
}

struct StationList_Previews: PreviewProvider {
    static var previews: some View {
        StationList()
    }
}
