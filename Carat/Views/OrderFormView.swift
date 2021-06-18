//
//  OrderFormView.swift
//  Carat
//
//  Created by Valerie 👩🏼‍💻 on 18/06/2021.
//

import SwiftUI

struct OrderFormView: View {
    @ObservedObject var order: Order
    var respond: (Bool, Order?) -> Void
    
    var body: some View {
        VStack {
            VStack {
                Text("Require an appointment")
                    .fontOldStandard(style: .title1, color: .paleGold)
                    .padding(.bottom, 20)
                
                Text("We are honoured by your interest and delighted you could enjoy jewellery made by our team.")
                    .fontOldStandard(color: .paleGold)
                    .multilineTextAlignment(.center)
                    .opacity(0.5)
            }
            .padding(.horizontal, 20)
            .padding(.top, 25)
            
            VStack {
                TextField("", text: $order.name)
                    .darkTextField(isPresented: order.name.isEmpty, contentType: .name)
                TextField("", text: $order.phoneNumber)
                    .darkTextField(isPresented: order.phoneNumber.isEmpty, contentType: .telephoneNumber)
                TextField("", text: $order.emailAddress)
                    .darkTextField(isPresented: order.emailAddress.isEmpty, contentType: .emailAddress)
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)
            .padding(.bottom, 20)
            
            Spacer()
            
            Button(action: {
                placeOrder()
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .stroke()
                        .foregroundColor(.paleGold)
                        .frame(height: 55)
                    Text("Send")
                        .fontOldStandard(style: .title2, color: .darkGold)
                }
            }
            .padding(.bottom, 30)
            .frame(height: 55)
            .disabled(order.isInvalid)
            .opacity(order.isInvalid ? 0.4 : 1)
            .padding(.horizontal, 20)
            Spacer()
        }
    }
    
    private func placeOrder() {
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
                respond(false, nil)
                return
            }
            if let decodedOrder = try? JSONDecoder().decode(Order.self, from: data) {
                respond(true, decodedOrder)
            } else {
                print("Invalid response from server")
            }
        }
        .resume()
    }
}

struct OrderFormView_Previews: PreviewProvider {
    static var previews: some View {
        OrderFormView(order: Order()) { _, _ in
        }
        .background(Color.onyx.ignoresSafeArea())
    }
}
