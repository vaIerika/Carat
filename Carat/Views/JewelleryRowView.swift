//
//  JewelleryRowView.swift
//  Carat
//
//  Created by Valerie 👩🏼‍💻 on 24/04/2020.
//

import SwiftUI

struct JewelleryRowView: View {
    @ObservedObject var order = Order()
    var items: [JewelleryView]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(items, id: \.uuid) { item in
                    NavigationLink(destination: DeliveryDetailsView(order: self.order, chosenJewellery: item.jewellery)) {
                        item
                    }
                    .buttonStyle(PlainButtonStyle())
                    .animation(.none)
                }
            }
            .padding(.horizontal, 15)
        }
        .edgesIgnoringSafeArea(.all)
    }
    
}

struct JewelleryRowView_Previews: PreviewProvider {
    static var previews: some View {
        JewelleryRowView(order: Order(), items: [
            JewelleryView(jewellery: .caledonia),
            JewelleryView(jewellery: .edmonia),
            JewelleryView(jewellery: .ambrette),
            JewelleryView(jewellery: .carmine),
            JewelleryView(jewellery: .nefertari),
            JewelleryView(jewellery: .scarlett)
        ])
    }
}
