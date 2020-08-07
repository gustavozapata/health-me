//
//  ElementsModifier.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 07/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.system(size: 18, weight: .bold)).foregroundColor(Color.black).padding(EdgeInsets(top: 8, leading: 22, bottom: 8, trailing: 22)).overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.black, lineWidth: 2)).background(Color.white)
    }
}

///These are two ways of calling the modifier
//extension View {
//    func buttonModifier() -> ModifiedContent<Self, ButtonModifier> {
//        return modifier(ButtonModifier())
//    }
//}
//extension View {
//    func buttonModifier() -> some View {
//        return self.modifier(ButtonModifier())
//    }
//}
///finally calling it
//Text("Next").buttonModifier()
//Text("Next").modifier(buttonModifier())
