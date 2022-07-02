//
//  Category.swift
//  boardshop
//
//  Created by Андрей Груненков on 02.07.2022.
//

import Foundation

struct Category: Codable {
    
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

extension Category {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Category.self, from: data) else { return nil }
        self = me
    }
}
