//
//  Offer.swift
//  IbottaDevTest
//
//  Created by Muhammad Luqman on 10/25/20.
//

import Foundation

class Offer: Decodable {
    
    var id: String
    var url: String?
    var name: String?
    var description: String
    var terms: String
    var currentValue: String
    var isFavorite = false
    
    enum CodingKeys : String, CodingKey {
        case id, url, name, description, terms, currentValue = "current_value"
    }
    
}
