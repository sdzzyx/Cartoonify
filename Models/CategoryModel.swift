//
//  CategoryModel.swift
//  Cartoonify
//
//  Created by Lenard Cortuna on 1/27/26.
//
import SwiftUI

struct Category: Identifiable, Decodable {
    let id: UUID
    let name: String
}
