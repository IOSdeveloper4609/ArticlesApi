//
//  ParsJSON.swift
//  NewsApi
//
//  Created by Азат Киракосян on 06.12.2020.
//

import Foundation

struct NetworkData: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

struct Article: Codable {
    let articleDescription: String?
    let urlToImage: URL?
    let title: String?
    let author: String?
   
    
    
    enum CodingKeys: String, CodingKey {
        case title
        case author
        case articleDescription = "description"
        case urlToImage
    }
}


