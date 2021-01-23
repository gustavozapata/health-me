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
                    Text("CBC Blood Test").font(.system(size: 25, weight: .bold)).fixedSize(horizontal: false, vertical: true)
                    Text("12 May, 2020").bold().font(.system(size: 16)).fixedSize(horizontal: false, vertical: true).foregroundColor(Color.green)
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 70, alignment: .topLeading).padding()
            }.padding(.top, 5)
            
            //Report
            VStack {
                VStack{
                    Image("bloodtype").font(.system(size: 60)).padding()
                    Text("Your blood type is B and it’s in 10% of people in the world, one of the least common blood groups").fontWeight(.medium).multilineTextAlignment(.center).fixedSize(horizontal: false, vertical: true)
                }.padding(.vertical, 25).frame(width: 270)
                
                HStack {
                    VStack {
                        Image("vessel").resizable().frame(width: 80, height: 80).padding()
                        Text("The blood vessels are the components of the circulatory system that transport blood throughout the human body").fontWeight(.medium).multilineTextAlignment(.leading).fixedSize(horizontal: false, vertical: true)
                    }.padding().frame(width: 270)
                    Spacer()
                }.padding(.vertical, 20)
                
                VStack {
                    Text("Red blood cells").font(.system(size: 20, weight: .semibold))
                    HStack{
                        Image("bloodcells").resizable().frame(width: 90, height: 80).padding()
                        Text("9,450").font(.system(size: 45, weight: .semibold))
                    }
                }.padding(.vertical, 20)
                
                VStack {
                    Text("White blood cells").font(.system(size: 20, weight: .semibold))
                    HStack{
                        Image("bloodcells").resizable().frame(width: 90, height: 80).padding()
                        Text("6,450").font(.system(size: 45, weight: .semibold))
                    }
                }.padding(.vertical, 20)
            }
        }.navigationBarHidden(true)
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView()
    }
}
