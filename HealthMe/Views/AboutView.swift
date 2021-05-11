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
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Design and developed").font(.system(size: 18, weight: .semibold))
                Text("by Gustavo Zapata").font(.system(size: 18, weight: .semibold))
                Text("Kingston University London").foregroundColor(.gray).fontWeight(.semibold)
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading).padding()
            
            Header(title: "Credits", subtitle: "Content used in the health report").padding(.top, 30)
            VStack(alignment: .leading, spacing: 10) {
                Text("Blood Type").fontWeight(.semibold).padding(.top, 10)
                Text("Video: https://youtu.be/xfZhb6lmxjk").foregroundColor(.blue)
                Text("Cholesterol").fontWeight(.semibold)
                Text("Video: https://youtu.be/inaqswqMDds").foregroundColor(.blue)
                Text("Glucose").fontWeight(.semibold).padding(.top, 10)
                Text("Video: https://youtu.be/F5nLAR-b8rg").foregroundColor(.blue)
                Text("Blood Cells").fontWeight(.semibold).padding(.top, 10)
                Text("Video: https://youtu.be/7KTkojnNhTU").foregroundColor(.blue)
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading).padding(.horizontal)
        }.navigationBarTitle("About")
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
