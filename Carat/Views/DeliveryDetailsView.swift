//
//  DeliveryDetailsView.swift
//  Carat
//
//  Created by Valerie 👩🏼‍💻 on 24/04/2020.
//

import SwiftUI

struct DeliveryDetailsView: View {
    @ObservedObject private var keyboard = KeyboardResponder()

    @ObservedObject var order: Order
    var chosenJewellery: Jewellery
    
    @State private var alertTitle = ""
    @State private var alertSubTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var body: some View {
        ZStack {
            Color.onyx
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                ZStack {
                    Image(self.order.jewellery.title)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 300)
                        .clipped()
                    
                    VStack {
                        Spacer()
                        HStack {
                            Text(self.order.jewellery.title)
                                .font(.custom("Bodoni-16-Bold", size: 22))
                            
                            Spacer()
                            
                            VStack(alignment: .trailing, spacing: 10) {
                                Text("Price")
                                    .foregroundColor(.darkGold)
                                Text(self.order.jewellery.price)
                            }
                            .font(.custom("OldStandardTT-Regular", size: 15))
                        }
                        .foregroundColor(.platinum)
                        .padding(.horizontal, 25)
                        .padding(.bottom, 15)
                    }
                }
                .frame(minHeight: 0, idealHeight: 300, maxHeight: 300)
                .clipped()

                VStack {
                    Text("Require an appointment")
                        .font(.custom("OldStandardTT-Regular", size: 22))
                        .padding(.bottom, 20)
                    
                    Text("We are honoured by your interest and delighted you could enjoy jewellery made by our team.")
                        .font(.custom("OldStandardTT-Regular", size: 15))
                        .multilineTextAlignment(.center)
                        .opacity(0.5)
                }
                .foregroundColor(.paleGold)
                .padding(.horizontal, 20)
                .padding(.top, 25)
                
                VStack {
                    TextField("Name", text: self.$order.name)
                        .textContentType(.name)
                        .modifier(TextFieldCustomStyle(showPlaceHolder: self.order.name.isEmpty, placeholder: "Name", image: "person"))
                    TextField("Phone", text: self.$order.phoneNumber)
                        .textContentType(.telephoneNumber)
                        .modifier(TextFieldCustomStyle(showPlaceHolder: self.order.phoneNumber.isEmpty, placeholder: "Phone number", image: "phone"))
                    TextField("Email", text: self.$order.emailAddress)
                        .textContentType(.emailAddress)
                        .modifier(TextFieldCustomStyle(showPlaceHolder: self.order.emailAddress.isEmpty, placeholder: "Email address", image: "paperplane"))
                }
                .padding(.horizontal, 20)
                .padding(.top, 10)
                .padding(.bottom, 20)
                
                Spacer()
                
                Button(action: {
                    self.placeOrder()
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .stroke()
                            .frame(height: 55)
                        Text("Send")
                            .font(.custom("OldStandardTT-Regular", size: 22))
                    }
                    
                }
                .frame(height: 55)
                .disabled(self.order.invalidInformation)
                .opacity(self.order.invalidInformation ? 0.4 : 1)
                .padding(.horizontal, 20)
                .foregroundColor(.darkGold)
                
                Spacer()
            }
            .edgesIgnoringSafeArea(.all)
            .opacity(self.showingAlert ? 0.2 : 1)
            
            if self.showingAlert {
                AlertCustomView(title: self.alertTitle, subtitle: self.alertSubTitle, message: self.alertMessage, shown: self.$showingAlert)
            }
        }
        .onAppear(perform: self.createOrder)
        .padding(.bottom, keyboard.currentHeight)
        .edgesIgnoringSafeArea(.bottom)
        .animation(.easeOut(duration: 0.16))
    }
    
    func createOrder() {
        order.jewellery = chosenJewellery
    }
    
    func placeOrder() {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/carat")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encoded
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
                self.alertTitle = "Something went wrong"
                self.alertSubTitle = "Please try again later"
                self.alertMessage = ""
                withAnimation {
                    self.showingAlert = true
                }
                return
            }
            
            if let decodedOrder = try? JSONDecoder().decode(Order.self, from: data) {
                self.alertTitle = "Thank you"
                self.alertSubTitle = "Request is sent."
                self.alertMessage = "You’ve chosen \(decodedOrder.jewellery.title), \(decodedOrder.jewellery.subtitle.lowercased()), we will prepare this magnificent jewellery, as well as a variety similar alternatives with different size for our appointement to help you make a perfect choice."
                withAnimation {
                    self.showingAlert = true
                }
                
            } else {
                print("Invalid response from server")
            }
        }
        .resume()
    }
}

struct DeliveryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DeliveryDetailsView(order: Order(), chosenJewellery: .caledonia)
    }
}
