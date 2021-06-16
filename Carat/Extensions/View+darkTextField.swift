//
//  TextFieldCustomStyle.swift
//  Carat
//
//  Created by Valerie 👩🏼‍💻 on 27/04/2020.
//

import SwiftUI

struct TextFieldCustomStyle: ViewModifier {
    var isPresented: Bool
    var placeholder: String
    var image: String
    
    public func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 30)
                .frame(height: 55)
                .foregroundColor(.midnight)
            
            
            Image(systemName: image)
                .font(.callout)
                .padding(.horizontal, 30)
                .foregroundColor(.white)
            
            if isPresented {
                Text(placeholder)
                    .fontOldStandard(color: .platinum)
                    .padding(.horizontal, 60)
                
            }
            content
                .fontOldStandard(color: .darkGold)
                .padding(.vertical, 15)
                .padding(.horizontal, 60)
        }
        .padding(.vertical, 10)
    }
}


extension View {
    func darkTextField(isPresented: Bool, placeholder: String, image imageName: String) -> some View {
        self.modifier(TextFieldCustomStyle(isPresented: isPresented, placeholder: placeholder, image: imageName))
    }
}

struct TextFieldCustomStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TextField("Email", text: .constant(""))
                .textContentType(.emailAddress)
                .darkTextField(isPresented: true, placeholder: "Email address", image: "paperplane")
            TextField("Email", text: .constant(""))
                .textContentType(.emailAddress)
                .darkTextField(isPresented: false, placeholder: "Email address", image: "paperplane")
        }
        .padding()
    }
}
