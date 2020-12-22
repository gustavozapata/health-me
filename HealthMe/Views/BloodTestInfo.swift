//
//  BloodTestInfo.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 21/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct BloodTestInfo: View {
    var test: BloodTestModel
    
    @State var isModified = false
    @State var isCanceled = false
    
    var body: some View {
        VStack {
            
            VStack(alignment: .leading, spacing: 40) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("LOCATION").font(.system(size: 13, weight: .black))
                        Text(test.location).font(.system(size: 18))
                    }
                    Spacer()
                    //                    NavigationLink(destination: Text("")){
                    //                     Text("Modify").foregroundColor(Color.green).fontWeight(.bold).underline()
                    //                    }
                    Button(action: {
                        self.isModified.toggle()
                    }){
                        Text("Modify").foregroundColor(Color.green).fontWeight(.semibold).underline()
                    }.sheet(isPresented: $isModified){
                        BookStation(modify: true)
                    }
                }
                VStack(alignment: .leading, spacing: 7) {
                    Text("ADDRESS").font(.system(size: 13, weight: .black))
                    Text(test.address).font(.system(size: 18))
                }
                VStack(alignment: .leading, spacing: 7) {
                    Text("DATE").font(.system(size: 13, weight: .black))
                    Text(test.date).font(.system(size: 18))
                }
                VStack(alignment: .leading, spacing: 7) {
                    Text("time".uppercased()).font(.system(size: 13, weight: .black))
                    Text(test.time).font(.system(size: 18))
                }
            }.padding(EdgeInsets(top: 40, leading: 20, bottom: 20, trailing: 20)).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 400, alignment: .topLeading)
            
            Text("Cancel").foregroundColor(Color(red: 100/255, green: 100/255, blue: 100/255)).underline()
                .onTapGesture{
                    self.isCanceled.toggle()
            }
            .alert(isPresented: $isCanceled) {
                Alert(title: Text("Are you sure you want to cancel this?"), message: Text("You can't undo this"), primaryButton: .destructive(Text("Yes")) {
                    print("Canceling...")
                    }, secondaryButton: .cancel(Text("No")))
            }
            
            Spacer()
        }
        .navigationBarTitle("Blood Test")
    }
}

struct BloodTestInfo_Previews: PreviewProvider {
    static var previews: some View {
        BloodTestInfo(test: pastTestsData[0])
    }
}
