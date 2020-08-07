//
//  Layout.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 06/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct Header: View {
    
    var title: String
    var subtitle: String
    
    init(title: String, subtitle: String) {
        self.title = title
        self.subtitle = subtitle
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(self.title).font(.system(size: 25, weight: .bold)).fixedSize(horizontal: false, vertical: true)
            Text(self.subtitle).font(.system(size: 16)).fixedSize(horizontal: false, vertical: true).lineSpacing(3)
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 70, alignment: .topLeading).padding()
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header(title: "Title", subtitle: "Text")
    }
}
