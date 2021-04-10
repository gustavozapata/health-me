//
//  IconButton.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 24/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct IconButton: View {
    
    var image: String
    
    var body: some View {
        Image(self.image).resizable().aspectRatio(contentMode: .fill).frame(width: 60)
            .padding(3).overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.border, lineWidth: 2))
    }
}
