//
//  BloodType.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 11/05/2021.
//  Copyright © 2021 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct BloodType: View {
    @State var showBloodTypeInfo = false
    var result: ResultsModel
    
    var body: some View {
        VStack{
            Image("bloodtype").resizable().frame(width: 120, height: 120)
            Text(result.blood_type).frame(width: 45, height: 45).background(RoundedRectangle(cornerRadius: 50).stroke(Color.green, lineWidth: 3)).font(.system(size: 18, weight: .medium)).padding(EdgeInsets(top: -15, leading: 0, bottom: 10, trailing: 0))
            Text("Your blood type is \(result.blood_type) and it’s in \(bloodTypeInfo(result.blood_type).percentage)% of people in the world\(bloodTypeInfo(result.blood_type).common != "" ? ", the \(bloodTypeInfo(result.blood_type).common) common blood group" : "")").fontWeight(.medium).multilineTextAlignment(.center).fixedSize(horizontal: false, vertical: true).lineSpacing(4)
            Image(systemName: "info.circle").foregroundColor(.blue).onTapGesture {
                withAnimation {showBloodTypeInfo.toggle()}
            }.padding(.top)
            if showBloodTypeInfo {
                Text("Group A blood must never be given to someone who has group B blood and vice versa. Group O can safely be given to any other group.").foregroundColor(.gray).font(.system(size: 13.5, weight: .medium)).padding(.top, 10)
            }
            
        }.padding(.vertical, 25).frame(width: 270)
    }
}

struct BloodType_Previews: PreviewProvider {
    static var previews: some View {
        BloodType(result: ResultsModel(blood_type: "AB-", test: "Full Blood Count", date: Date(), red_blood_cells: 2000, whiteBloodCells: 2400, cholesterolLevel: 100, glucose_level: 200, hemoglobin: 90, plateletCount: 90))
    }
}
