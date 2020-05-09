//
//  ContentView.swift
//  Carat
//
//  Created by Valerie 👩🏼‍💻 on 24/04/2020.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.onyx
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    JewelleryRowView(items: [
                        JewelleryView(jewellery: .caledonia),
                        JewelleryView(jewellery: .edmonia),
                        JewelleryView(jewellery: .ambrette),
                        JewelleryView(jewellery: .carmine),
                        JewelleryView(jewellery: .nefertari),
                        JewelleryView(jewellery: .scarlett)
                    ])
                }
            }
        }
        .accentColor(.darkGold)
        .statusBar(hidden: true)
    }
    
    // Customize Back button apperance
    init() {
        UIBarButtonItem.appearance().setTitleTextAttributes(
        [
            NSAttributedString.Key.font : UIFont(name: "OldStandardTT-Regular", size: 17)!
        ], for: .normal)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
