//
//  UIColor.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 11/07/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import SwiftUI
// Below is another way of using rgb colors
//.accentColor(Color(red: 6/255, green: 20/255, blue: 250/255))

let lightGrey = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
let lightBorder = Color(red: 211/255, green: 225/255, blue: 230/255)
let blueGray = Color(red: 143/255, green: 157/255, blue: 181/255)

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}

//Own defined colours 
extension Color {
    static let selectedItem = Color("selectedItem")
    static let bgGradient1 = Color("bgGradient1")
    static let bgGradient2 = Color("bgGradient2")
    static let bgBlue = Color("bgBlue")
    static let messageBg = Color("messageBg")
    static let blueVybz = Color("blueVybz")
    static let buttonGradient = Color("buttonGradient")
    static let theme = Color("theme")
    static let themeReverse = Color("themeReverse")
    static let resultCard = Color("resultCard")
    static let border = Color("border")
    static let bw = Color("bw")
    static let borderDate = Color("borderDate")
    static let shadow = Color("shadow")
    static let azul = Color("azul")
}
