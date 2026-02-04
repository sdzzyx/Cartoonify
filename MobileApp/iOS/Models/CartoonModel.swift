//
//  CartoonModel.swift
//  Cartoonify
//
//  Created by Lenard Cortuna on 1/26/26.
//

import SwiftUI

struct Cartoon: Identifiable, Decodable {
    let id: UUID
    let title: String
    let description: String
    let imageUrl: String
    let createdAt: Date
    var isFavorite: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case imageUrl = "image_url"
        case createdAt = "created_at"
    }
}


