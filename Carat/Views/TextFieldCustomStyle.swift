//
//  TextFieldCustomStyle.swift
//  Carat
//
//  Created by Valerie 👩🏼‍💻 on 27/04/2020.
//

import SwiftUI

struct TextFieldCustomStyle: ViewModifier {
    var showPlaceHolder: Bool
    var placeholder: String
    var image: String
    
    public func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 30)
                .frame(height: 55)
                .foregroundColor(.midnight)
            
            
            Image(systemName: image)
                .font(.callout)
                .padding(.horizontal, 30)
                .foregroundColor(.white)
            
            if showPlaceHolder {
                Text(placeholder)
                    .font(.custom("OldStandardTT-Regular", size: 15))
                    .foregroundColor(.platinum)
                    .padding(.horizontal, 60)
                
            }
            content
                .foregroundColor(.darkGold)
                .font(.custom("OldStandardTT-Regular", size: 15))
                .padding(.vertical, 15)
                .padding(.horizontal, 60)
        }
        .padding(.vertical, 10)
    }
}
