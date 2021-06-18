//
//  JewelleryView.swift
//  Carat
//
//  Created by Valerie 👩🏼‍💻 on 24/04/2020.
//

import SwiftUI

struct JewelleryView: View {
    let jewellery: Jewellery
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomLeading) {
                Image("\(jewellery.title)")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .clipped()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Price")
                        .foregroundColor(.darkGold)
                    Text(jewellery.price)
                }
                .fontOldStandard(color: .platinum)
                .padding()
            }
            VStack {
                Text(jewellery.title)
                    .fontBodoni(style: .largeTitle, color: .platinum)
                    .padding(.top, 17)
                    .padding(.bottom, 10)
                
                Text(jewellery.subtitle.uppercased())
                    .fontOldStandard(style: .footnote, color: .paleGold)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 35)
                
                Text(jewellery.description)
                    .fontOldStandard(style: .footnote, color: .platinum)
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
                    .lineSpacing(5)
                    .padding(.horizontal, 15)
                    .padding(.bottom, 30)
                
                Image("textDivider")
                    .padding(.bottom, 100)
            }
            .padding(.horizontal, 8)
        }
        .ignoresSafeArea()
        .background(Color.onyx)
    }
}

struct JewelleryView_Previews: PreviewProvider {
    static var previews: some View {
        JewelleryView(jewellery: .caledonia)
    }
}
