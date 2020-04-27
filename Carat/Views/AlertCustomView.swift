//
//  AlertCustomView.swift
//  Carat
//
//  Created by Valerie 👩🏼‍💻 on 27/04/2020.
//

import SwiftUI

struct AlertCustomView: View {
    var title: String
    var subtitle: String
    var message: String
    @Binding var shown: Bool
    
    var body: some View {
        ZStack {
            VStack {
                Text(title)
                    .font(.custom("Bodoni-16-Bold", size: 22))
                    .padding(.top, 55)
                    .padding(.bottom, 30)
                VStack {
                    Text(subtitle)
                    if !message.isEmpty {
                        Text(message)
                            .opacity(0.6)
                            .padding(.top, 20)

                    }
                }
                .padding(.horizontal, 45)
                
                Button(action: {
                    self.shown = false
                }) {
                    Text("Close")
                        .foregroundColor(.darkGold)
                }
                .padding(.top, 30)
                .padding(.bottom, 50)
                
            }
            .font(.custom("OldStandardTT-Regular", size: 15))
            .foregroundColor(.onyx)
        }
            .background(Color.paleGold)
            .padding(.horizontal, 35)
    }
}

struct AlertCustomView_Previews: PreviewProvider {
    static var previews: some View {
        AlertCustomView(title: "Thank you", subtitle: "The request is sent.", message: "", shown: .constant(true))
    }
}
