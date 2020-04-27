//
//  Order.swift
//  Carat
//
//  Created by Valerie 👩🏼‍💻 on 24/04/2020.
//

import Foundation
import SwiftUI

class Order: ObservableObject, Codable {
    enum CodingKeys: CodingKey {
        case jewellery, name, emailAddress, phoneNumber
    }
    
    @Published var jewellery = Jewellery.caledonia
    @Published var name = "Carlos"
    @Published var emailAddress = "example@gmail.com"
    @Published var phoneNumber = "+321 910 372 28 83"
    
    var invalidInformation: Bool {
        let validName = name.trimmingCharacters(in: .whitespacesAndNewlines)
        let validEmailAddress = emailAddress.trimmingCharacters(in: .whitespacesAndNewlines)
        let validPhoneNumber = phoneNumber.trimmingCharacters(in: .whitespacesAndNewlines)

        if validName.count < 3 || validEmailAddress.count < 6 || validPhoneNumber.count < 7 {
            return true
        }
        return false 
    }
    
    init() {}
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        jewellery = try container.decode(Jewellery.self, forKey: .jewellery)
        name = try container.decode(String.self, forKey: .name)
        emailAddress = try container.decode(String.self, forKey: .emailAddress)
        phoneNumber = try container.decode(String.self, forKey: .phoneNumber)
    }
    
    func encode(to encoder: Encoder) throws {
        var conrainer = encoder.container(keyedBy: CodingKeys.self)
        try conrainer.encode(jewellery, forKey: .jewellery)
        try conrainer.encode(name, forKey: .name)
        try conrainer.encode(emailAddress, forKey: .emailAddress)
        try conrainer.encode(phoneNumber, forKey: .phoneNumber)
    }
}
