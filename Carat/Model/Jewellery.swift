//
//  Jewellery.swift
//  Carat
//
//  Created by Valerie 👩🏼‍💻 on 24/04/2020.
//

import Foundation
import SwiftUI

struct Jewellery: Codable {
    let title: String
    let subtitle: String
    let description: String
    let price: String
}

extension Jewellery {
    static let caledonia = Jewellery(title: "Caledonia", subtitle: "4.01 carat Fancy pear shape diamond ring", description: "Among the scarcest gemstones in the world, this 4.01 carat Fancy pear shape diamond is a true wonder of nature. \n\n\nThe timeless silhouette of the pear shape accentuates its beautiful icy blue hue while the tapered diamond band creates a scintillating circle around this remarkable rarity.", price: "€ 10,800")
    
    static let edmonia = Jewellery(title: "Edmonia", subtitle: "22.42 carats Square Emerald Cut Earrings", description: "We offer various sizes of emerald cut and square emerald cut diamond earrings, elegantly set upon diamond swan hooks with scintillating interconnecting stones.", price: "€ 36,500")
    
    static let scarlett = Jewellery(title: "Scarlett", subtitle: "8.5 carat Square Emerald Cut Stud Earrings", description: "Sophisticated and timeless, our selection of square emerald cut diamond studs, available in various carat weights, are a striking alternative to round diamonds.", price: "€ 18,000")
    
    static let nefertari = Jewellery(title: "Nefertari", subtitle: "3.62 carats of emeralds and 2.49 carats of diamonds", description: "Classic diamond swan hook earrings showcase a variety of gemstones, including rich rubies, vibrant emeralds and sumptuous sapphires.", price: "€ 8,900")
    
    static let carmine = Jewellery(title: "Carmine", subtitle: "2.39 Carat Round Cut Emerald and Diamond Drop Earrings", description: "A sensational display of round cut shape emerald and diamonds are artfully arranged into scintillating streams of brilliance in these cascading earrings.", price: "€ 7,500")
    
    static let ambrette = Jewellery(title: "Ambrette", subtitle: "26.18 carats", description: "Set with an astonishing 26.18 carats of diamonds, these unique high jewellery earrings frame the face with brilliance. \n\n\nRound and pear shape stones cascade downwards from pear shape diamonds, forming an exquisitely feminine silhouette, accompanied by elegant emerald cut diamonds.", price: "€ 86,700")
    
}
