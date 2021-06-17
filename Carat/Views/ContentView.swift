//
//  ContentView.swift
//  Carat
//
//  Created by Valerie 👩🏼‍💻 on 24/04/2020.
//

import SwiftUI

struct ContentView: View {
    let items = Catalogue().jewelleries
    
    @ObservedObject var order = Order()
    @State private var showDetails = false
    @State private var chosenItem: Jewellery? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                TabView {
                    ForEach(items) { item in
                        ScrollView(.vertical, showsIndicators: false) {
                            JewelleryView(jewellery: item)
                                .buttonStyle(PlainButtonStyle())
                                .onTapGesture {
                                    chosenItem = item
                                    showDetails = true
                                }
                            NavigationLink("", destination: DeliveryDetailsView(order: order, chosenJewellery: item), isActive: $showDetails)
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
