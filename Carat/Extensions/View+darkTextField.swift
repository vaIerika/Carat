//
//  TextFieldCustomStyle.swift
//  Carat
//
//  Created by Valerie 👩🏼‍💻 on 27/04/2020.
//

import SwiftUI

struct TextFieldCustomStyle: ViewModifier {
    var isPresented: Bool
    var contentType: UITextContentType
    var placeholder: String?
    var systemImage: String?
    
    private var defaultByType: (placeholder: String, systemImage: String) {
        switch contentType {
        case .name: return (placeholder: "Name", systemImage: "person")
        case .telephoneNumber: return (placeholder: "Phone number", systemImage: "phone")
        case .emailAddress: return (placeholder: "Email address", systemImage: "paperplane")
        default: return (placeholder: "", systemImage: "square.and.pencil")
        }
    }
    
    public func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 30)
                .frame(height: 55)
                .foregroundColor(.midnight)
            
            Image(systemName: systemImage ?? defaultByType.systemImage)
                .font(.callout)
                .padding(.horizontal, 30)
                .foregroundColor(.white)
            
            if isPresented {
                Text(placeholder ?? defaultByType.placeholder)
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


extension TextField {
    func darkTextField(isPresented: Bool, contentType: UITextContentType, placeholder: String? = nil, systemImage: String? = nil) -> some View {
        self
            .modifier(TextFieldCustomStyle(isPresented: isPresented, contentType: contentType, placeholder: placeholder, systemImage: systemImage))
            .textContentType(contentType)
    }
}

struct TextFieldCustomStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TextField("Name", text: .constant(""))
                .darkTextField(isPresented: true, contentType: .name)
            TextField("Email", text: .constant(""))
                .darkTextField(isPresented: true, contentType: .emailAddress)
            TextField("Phone", text: .constant(""))
                .darkTextField(isPresented: false, contentType: .telephoneNumber)
        }
        .padding()
    }
}
