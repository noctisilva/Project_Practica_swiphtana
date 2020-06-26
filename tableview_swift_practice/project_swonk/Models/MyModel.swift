//
//  MyModel.swift
//  tableview_swift_practice
//
//  Created by Tae Hong Min on 6/17/20.
//  Copyright © 2020 tableview.practice.com. All rights reserved.
//

import Foundation

struct Response:Codable{
    var businesses: [Business]?
}
struct Business: Codable {
    var id: String
    var name: String?
    var image_url: String?
    var price: String?
    var location: Location?
}
struct Location: Codable {
    var address1: String?
    var city: String?
    var zipCode: String?
    var country: String?
    var state: String?
    
    enum CodingKeys: String, CodingKey {
        case address1
        case city
        case zipCode = "zip_code"
        case country
        case state
    }
}

class PlayData {
    var allWords = [String]()
}
