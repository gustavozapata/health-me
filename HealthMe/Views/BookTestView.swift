//
//  BookTestView.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 16/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct BookTestView: View {
    
    var body: some View {
        
        VStack {
            
            VStack(alignment: .leading, spacing: 30) {
                
                VStack(alignment: .leading) {
                    Text("Where").font(.system(size: 25, weight: .bold))
                    Text("Select a blood station").font(.system(size: 16))
                }
                
            }.padding().frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, alignment: .topLeading)
                .navigationBarTitle("Book Test")
            
            VStack(alignment: .center) {
                StationList()
            }
            Spacer()
        }
    }
}

struct BookTestView_Preview: PreviewProvider {
    static var previews: some View {
        BookTestView()
    }
}
