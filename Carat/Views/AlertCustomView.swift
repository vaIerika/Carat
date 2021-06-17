//
//  AlertCustomView.swift
//  Carat
//
//  Created by Valerie 👩🏼‍💻 on 27/04/2020.
//

import SwiftUI

struct AlertCustomView: View {
    @Binding var isPresented: Bool
    var title: String
    var subtitle: String
    var message: String
    
    var body: some View {
        VStack {
            Text(title)
                .fontBodoni()
                .padding(.top, 10)
                .padding(.bottom, 30)
            Group {
                Text(subtitle)
                Text(message)
                    .opacity(message.isEmpty ? 0 : 0.6)
                    .padding(.top, 20)
            }.fontOldStandard()
            
            Button(action: {
                isPresented = false
            }) {
                Text("close")
                    .fontOldStandard(style: .headline, color: .darkGold)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 5)
            .background(RoundedRectangle(cornerRadius: 25.0).fill(Color.platinum.opacity(0.7)))
            .padding(.top, 20)
            
        }
        .padding(30)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.paleGold)
        )
        .padding(.horizontal, 40)
    }
}

struct AlertCustomView_Previews: PreviewProvider {
    static var previews: some View {
        AlertCustomView(isPresented: .constant(true), title: "Thank you", subtitle: "You have made an amazing choice! The request is sent.", message: "Best wishes.")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.onyx.edgesIgnoringSafeArea(.all))
    }
}
