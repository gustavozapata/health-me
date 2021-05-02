//
//  MessagesOptions.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 12/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

// custom styling to attach to elements
struct MessagesOptions: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .background(Color.purple).cornerRadius(20).font(.system(size: 16, weight: .bold))
    }
}
