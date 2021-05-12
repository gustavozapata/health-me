//
//  AboutView.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 31/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ScrollView {
            VStack {
                Header(title: "Health Me", subtitle: "Get to know yourself better")
            }
            
            VStack(spacing: 12) {
                Text("Design and developed").font(.system(size: 20, weight: .semibold))
                Text("by")
                Text("Gustavo Zapata").font(.system(size: 20, weight: .semibold))
                Text("Kingston University London").foregroundColor(.blue).fontWeight(.semibold)
            }.padding(.top, 40)
            
            Text("Credits").font(.system(size: 21, weight: .semibold)).padding(.top, 90)
            Text("Content used in the health report").font(.system(size: 15)).padding(.top, 3)
            VStack(alignment: .leading, spacing: 10) {
                Text("Blood Type").fontWeight(.medium).padding(.top, 8)
                Text("Video: https://youtu.be/xfZhb6lmxjk").foregroundColor(.gray)
                Text("Cholesterol").fontWeight(.medium).padding(.top, 8)
                Text("Video: https://youtu.be/inaqswqMDds").foregroundColor(.gray)
                Text("Glucose").fontWeight(.medium).padding(.top, 8)
                Text("Video: https://youtu.be/F5nLAR-b8rg").foregroundColor(.gray)
                Text("Blood Cells").fontWeight(.medium).padding(.top, 8)
                Text("Video: https://youtu.be/7KTkojnNhTU").foregroundColor(.gray)
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading).font(.system(size: 14)).padding()
        }.navigationBarTitle("About")
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
