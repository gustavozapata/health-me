//
//  CustomFonts.swift
//  HealthMe
//
//  Created by Gustavo Zapata on 05/08/2020.
//  Copyright © 2020 Gustavo Zapata. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

//struct Poppins: ViewModifier {
//    @Environment(\.sizeCategory) var sizeCategory
//    var textStyle: Font.TextStyle
//
//    init(_ textStyle: Font.TextStyle = .body) {
//        self.textStyle = textStyle
//    }
//
//    func body(content: Content) -> some View {
//        content.font(getFont())
//    }
//
//    func getFont() -> Font {
//        switch(sizeCategory) {
//        case .extraSmall:
//            return Font.custom("Poppins", size: 16 * getStyleFactor())
//        case .small:
//            return Font.custom("Poppins", size: 21 * getStyleFactor())
//        case .medium:
//            return Font.custom("Poppins", size: 24 * getStyleFactor())
//        case .large:
//            return Font.custom("Poppins", size: 28 * getStyleFactor())
//        case .extraLarge:
//            return Font.custom("Poppins", size: 32 * getStyleFactor())
//        case .extraExtraLarge:
//            return Font.custom("Poppins", size: 36 * getStyleFactor())
//        case .extraExtraExtraLarge:
//            return Font.custom("Poppins", size: 40 * getStyleFactor())
//        case .accessibilityMedium:
//            return Font.custom("Poppins", size: 48 * getStyleFactor())
//        case .accessibilityLarge:
//            return Font.custom("Poppins", size: 52 * getStyleFactor())
//        case .accessibilityExtraLarge:
//            return Font.custom("Poppins", size: 60 * getStyleFactor())
//        case .accessibilityExtraExtraLarge:
//            return Font.custom("Poppins", size: 66 * getStyleFactor())
//        case .accessibilityExtraExtraExtraLarge:
//            return Font.custom("Poppins", size: 72 * getStyleFactor())
//        @unknown default:
//            return Font.custom("Poppins", size: 36 * getStyleFactor())
//        }
//    }
//
//    func getStyleFactor() -> CGFloat {
//        switch textStyle {
//        case .caption:
//            return 0.6
//        case .footnote:
//            return 0.7
//        case .subheadline:
//            return 0.8
//        case .callout:
//            return 0.9
//        case .body:
//            return 1.0
//        case .headline:
//            return 1.2
//        case .title:
//            return 1.5
//        case .largeTitle:
//            return 2.0
//        @unknown default:
//            return 1.0
//        }
//    }
//
//}


extension Font {

    /// Create a font with the large title text style.
    public static var largeTitle: Font {
        return Font.custom("Poppins-Regular", size: UIFont.preferredFont(forTextStyle: .largeTitle).pointSize)
    }

    /// Create a font with the title text style.
    public static var title: Font {
        return Font.custom("Poppins-Regular", size: UIFont.preferredFont(forTextStyle: .title1).pointSize)
    }

    /// Create a font with the headline text style.
    public static var headline: Font {
        return Font.custom("Poppins-Regular", size: UIFont.preferredFont(forTextStyle: .headline).pointSize)
    }

    /// Create a font with the subheadline text style.
    public static var subheadline: Font {
        return Font.custom("Poppins-Light", size: UIFont.preferredFont(forTextStyle: .subheadline).pointSize)
    }

    /// Create a font with the body text style.
    public static var body: Font {
        return Font.custom("Poppins-Regular", size: UIFont.preferredFont(forTextStyle: .body).pointSize)
    }

    /// Create a font with the callout text style.
    public static var callout: Font {
        return Font.custom("Poppins-Regular", size: UIFont.preferredFont(forTextStyle: .callout).pointSize)
    }

    /// Create a font with the footnote text style.
    public static var footnote: Font {
        return Font.custom("Poppins-Regular", size: UIFont.preferredFont(forTextStyle: .footnote).pointSize)
    }

    /// Create a font with the caption text style.
    public static var caption: Font {
        return Font.custom("Poppins-Regular", size: UIFont.preferredFont(forTextStyle: .caption1).pointSize)
    }

    public static func system(size: CGFloat, weight: Font.Weight = .regular, design: Font.Design = .default) -> Font {
        var font = "Poppins-Regular"
        switch weight {
        case .black: font = "Poppins-Black"
        case .bold: font = "Poppins-Bold"
        case .heavy: font = "Poppins-ExtraBold"
        case .light: font = "Poppins-Light"
        case .medium: font = "Poppins-Medium"
        case .semibold: font = "Poppins-SemiBold"
        case .thin: font = "Poppins-Thin"
        case .ultraLight: font = "Poppins-Thin"
        default: break
        }
        return Font.custom(font, size: size)
    }
}
