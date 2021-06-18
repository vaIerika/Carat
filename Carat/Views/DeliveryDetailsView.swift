//
//  DeliveryDetailsView.swift
//  Carat
//
//  Created by Valerie 👩🏼‍💻 on 24/04/2020.
//

import SwiftUI

struct DeliveryDetailsView: View {
    @Environment (\.presentationMode) var presentationMode
    @ObservedObject private var keyboard = KeyboardResponder()
    @ObservedObject var order: Order
    
    @State private var showingAlert = false
    @State private var alertTitle = ""
    @State private var alertSubTitle = ""
    @State private var alertMessage = ""
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ZStack {
                        Image(order.jewellery.title)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 300)
                            .clipped()
                            .overlay(
                                VStack {
                                    Button(action: {
                                        presentationMode.wrappedValue.dismiss()
                                    }) {
                                        HStack {
                                            Image(systemName: "chevron.backward")
                                            Text("Back")
                                        }
                                    }
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.top, 50)
                                    Spacer()
                                    HStack {
                                        Text(order.jewellery.title)
                                            .fontBodoni(color: .platinum)
                                        Spacer()
                                        VStack(alignment: .trailing, spacing: 10) {
                                            Text("Price")
                                                .foregroundColor(.darkGold)
                                            Text(order.jewellery.price)
                                        }
                                    }
                                }
                                .padding(.horizontal, 25)
                                .padding(.bottom, 15)
                                .fontOldStandard(color: .platinum)
                            )
                    }
                    OrderFormView(order: order) { success, decodedOrder in
                        showAlert(for: success, with: decodedOrder)
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .opacity(showingAlert ? 0.2 : 1)
            }
            .padding(.bottom, keyboard.currentHeight)
            
            if showingAlert {
                AlertCustomView(isPresented: $showingAlert, title: alertTitle, subtitle: alertSubTitle, message: alertMessage)
                
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .background(
            Color.onyx.edgesIgnoringSafeArea(.all)
        )
    }
    
    private func showAlert(for success: Bool, with decodedOrder: Order?) {
        if let decodedOrder = decodedOrder, success {
            alertTitle = "Thank you"
            alertSubTitle = "Request is sent."
            alertMessage = "You’ve chosen \(decodedOrder.jewellery.title), \(decodedOrder.jewellery.subtitle.lowercased()), we will prepare this magnificent jewellery, as well as a variety similar alternatives with different size for our appointement to help you make a perfect choice."
            withAnimation {
                showingAlert = true
            }
        } else {
            alertTitle = "Something went wrong"
            alertSubTitle = "Please try again later"
            alertMessage = ""
            withAnimation {
                showingAlert = true
            }
        }
    }
}

struct DeliveryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DeliveryDetailsView(order: Order())
    }
}
