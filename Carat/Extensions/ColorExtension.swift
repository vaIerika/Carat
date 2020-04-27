//
//  ColorExtension.swift
//  Carat
//
//  Created by Valerie 👩🏼‍💻 on 24/04/2020.
//

import SwiftUI

extension Color {
    static let onyx = Color(red: 13/255, green: 12/255, blue: 10/255)
    static let darkGold = Color(red: 180/255, green: 119/255, blue: 45/255)
    static let paleGold = Color(red: 190/255, green: 162/255, blue: 104/255)
    static let platinum = Color(red: 209/255, green: 206/255, blue: 195/255)
    static let midnight = Color(red: 18/255, green: 18/255, blue: 18/255)
}

struct ColorExtension_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            Circle()
                .foregroundColor(.onyx)
            Circle()
                .foregroundColor(.darkGold)
            Circle()
                .foregroundColor(.paleGold)
            Circle()
                .foregroundColor(.platinum)
            Circle()
                .foregroundColor(.midnight)
        }
        .padding()
    }
}
