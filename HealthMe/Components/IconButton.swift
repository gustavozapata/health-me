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
        Image(self.image).resizable().aspectRatio(contentMode: .fill).frame(width: 50).padding(15).overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(red: 159/255, green: 173/255, blue: 192/255), lineWidth: 2))
    }
}
