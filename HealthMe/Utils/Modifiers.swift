//
//  Modifiers.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 06/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import Foundation
import SwiftUI

struct SubtitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.white)
            .padding()
    }
}
