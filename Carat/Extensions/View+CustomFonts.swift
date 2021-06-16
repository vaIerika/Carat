//
//  View+CustomFonts.swift
//  Carat
//
//  Created by Valerie 👩🏼‍💻 on 16/06/2021.
//

import SwiftUI


//.font(.custom("Bodoni-16-Bold", size: 22))
//
//    .font(.custom("OldStandardTT-Regular", size: 15))
//    .font(.custom("OldStandardTT-Regular", size: 15))


struct BodoniFontModifier: ViewModifier {
    var style: UIFont.TextStyle
    var color: Color
    
    private let fontName = "Bodoni-16-Bold"
    
    func body(content: Content) -> some View {
        content
            .font(.custom(fontName, size: UIFont.preferredFont(forTextStyle: style).pointSize))
            .foregroundColor(color)
        }
}

struct OldStandardModifier: ViewModifier {
    var style: UIFont.TextStyle
    var color: Color
    
    private let fontName = "OldStandardTT-Regular"
    
    func body(content: Content) -> some View {
        content
            .font(.custom(fontName, size: UIFont.preferredFont(forTextStyle: style).pointSize))
            .foregroundColor(color)
    }
}

extension View {
    func fontBodoni(style: UIFont.TextStyle = .title2, color: Color = .onyx) -> some View {
        self.modifier(BodoniFontModifier(style: style, color: color))
    }
    func fontOldStandard(style: UIFont.TextStyle = .callout, color: Color = .onyx) -> some View {
        self.modifier(OldStandardModifier(style: style, color: color))
    }
}
