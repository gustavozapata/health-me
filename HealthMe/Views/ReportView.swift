//
//  ReportView.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 01/09/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct ReportView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                //                NavigationLink(destination: BloodResultsView()){
                Image(systemName: "arrow.left").font(.system(size: 30, weight: .bold)).foregroundColor(Color.green).padding(.leading)
                //                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("CBC Blood Test").font(.system(size: 25, weight: .bold)).fixedSize(horizontal: false, vertical: true)
                    Text("12 May, 2020").bold().font(.system(size: 16)).fixedSize(horizontal: false, vertical: true).foregroundColor(Color.green)
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 70, alignment: .topLeading).padding()
            }.padding(.top, 30)
            
            //Report
            VStack {
                VStack{
                    Image(systemName: "pencil.tip.crop.circle.badge.plus").font(.system(size: 60)).padding()
                    Text("Your blood type is B and it’s in 18% of people in the world").fontWeight(.medium).multilineTextAlignment(.center).fixedSize(horizontal: false, vertical: true)
                }.padding(.vertical, 25).frame(width: 270)
                
                HStack {
                    VStack {
                        Image(systemName: "pencil.tip.crop.circle.badge.plus").font(.system(size: 60)).padding()
                        Text("The heart is the part of our body where we always want to take care of and be able to live").fontWeight(.medium).multilineTextAlignment(.leading).fixedSize(horizontal: false, vertical: true)
                    }.padding().frame(width: 270)
                    Spacer()
                }.padding(.vertical, 20)
                
                HStack {
                    Spacer()
                    VStack {
                        Image(systemName: "pencil.tip.crop.circle.badge.plus").font(.system(size: 60)).padding()
                        Text("The heart is the part of our body where we always want to take care of and be able to live").fontWeight(.medium).multilineTextAlignment(.trailing).fixedSize(horizontal: false, vertical: true)
                    }.padding().frame(width: 270)
                }.padding(.vertical, 20)
            }
        }.navigationBarTitle("").navigationBarHidden(true)
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView()
    }
}
