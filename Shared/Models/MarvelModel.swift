//
//  MarvelModel.swift
//  PracticaMarvelApp (iOS)
//
//  Created by Ruben Lucena on 26/9/21.
//

import Foundation

struct MarvelModel: Codable {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: DataMarvel
}

// MARK: - DataClass
struct DataMarvel: Codable {
    let offset, limit, total, count: Int
    let results: [Result]
}

// MARK: - Result
struct Result: Codable , Identifiable{
    let id: Int
    let title:String?
    let name: String?
    let description: String?
    let thumbnail: Thumbnail
    let resourceURI: String?
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let path: String
    let thumbnailExtension: Extension

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
    
}

enum Extension: String, Codable {
    case gif = "gif"
    case jpg = "jpg"
    case png = "png"
}
