//
//  Product.swift
//  boardshop
//
//  Created by Андрей Груненков on 02.07.2022.
//

import Foundation

struct Product: Codable {
    
    let id: String
    let name: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case url
    }
}

// MARK: Convenience initializers

extension Product {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Product.self, from: data) else { return nil }
        self = me
    }
}
