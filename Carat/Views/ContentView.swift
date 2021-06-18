//
//  ContentView.swift
//  Carat
//
//  Created by Valerie 👩🏼‍💻 on 24/04/2020.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var order = Order()
    let items = Catalogue().jewelleries
    
    @State private var showDetails = false
    
    var body: some View {
        NavigationView {
            VStack {
                TabView {
                    ForEach(items) { item in
                        ScrollView(.vertical, showsIndicators: false) {
                            JewelleryView(jewellery: item)
                                .buttonStyle(PlainButtonStyle())
                                .onTapGesture {
                                    order.jewellery = item
                                    showDetails = true
                                }
                            NavigationLink("", destination: DeliveryDetailsView(order: order), isActive: $showDetails)
                        }
                    }.padding(.horizontal, 15)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .background(Color.onyx)
            }
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea(.all)
            .background(Color.onyx)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
