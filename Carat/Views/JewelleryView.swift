//
//  JewelleryView.swift
//  Carat
//
//  Created by Valerie 👩🏼‍💻 on 24/04/2020.
//

import SwiftUI

struct JewelleryView: View {
     let uuid = UUID()
    let jewellery: Jewellery
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ZStack {
                Color.onyx
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    ZStack {
                        Image("\(self.jewellery.title)")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .edgesIgnoringSafeArea(.all)
                            .frame(width: 380, height: 680)
                            .clipShape(Rectangle())
                        HStack {
                            VStack(alignment: .leading, spacing: 10) {
                                Spacer()
                                Text("Price")
                                    .foregroundColor(.darkGold)
                                Text(self.jewellery.price)
                            }
                            .fontOldStandard(color: .platinum)
                            //.font(.custom("OldStandardTT-Regular", size: 15))
                           // .foregroundColor(.platinum)
                            .padding(.leading, 20)
                            .padding(.bottom, 20)
                            Spacer()
                        }
                    }
                    .frame(width: 380, height: 680)
                    
                    VStack {
                        Text(self.jewellery.title)
                            .fontBodoni(style: .largeTitle, color: .platinum)
                         //   .font(.custom("Bodoni-16-Bold", size: 32))
                           // .foregroundColor(.platinum)
                            .padding(.top, 17)
                            .padding(.bottom, 10)
                        Text(self.jewellery.subtitle.uppercased())
                            .font(.custom("OldStandardTT-Regular", size: 11))
                            .foregroundColor(.paleGold)
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 35)
                       
                        Text(self.jewellery.description)
                            .fontOldStandard(style: .footnote, color: .platinum)
                            .fixedSize(horizontal: false, vertical: true)
                            //.font(.custom("OldStandardTT-Regular", size: 15))
                            //.foregroundColor(.platinum)
                            .multilineTextAlignment(.center)
                            .lineSpacing(5)
                            .layoutPriority(2)
                            .lineLimit(20)
                            .padding(.horizontal, 15)
                            .padding(.bottom, 30)

                         Image("textDivider")
                            .padding(.bottom, 60)
                    }
                    .frame(width: 370)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct JewelleryView_Previews: PreviewProvider {
    static var previews: some View {
        JewelleryView(jewellery: .caledonia)
    }
}
