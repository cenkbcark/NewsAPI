//
//  NewsResponseModel.swift
//  NewsAPI
//
//  Created by Cenk Bahadır Çark on 13.09.2022.
//

import Foundation

// MARK: - NewsResponseModel
struct NewsResponseModel: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [News]?
}

// MARK: - Article
struct News: Codable {
    let source: Source?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String? //
    let content: String?

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case description
        case url, urlToImage, publishedAt, content
    }
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String?
}
