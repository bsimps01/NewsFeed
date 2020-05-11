//
//  NewsStructs.swift
//  NewsFeed
//
//  Created by Benjamin Simpson on 5/7/20.
//  Copyright © 2020 Benjamin Simpson. All rights reserved.
//

import Foundation

public struct Source: Decodable {
    let id: String?
    let name: String?
}

public struct Article: Decodable {
    let source: Source
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let content: String?
    let urlToImage: String?
}

public struct NewsSource: Decodable {
    let id: String?
    let name: String?
    let category: String?
}

public struct AllNewsSources: Decodable {
    let sources: [NewsSource]
}

public struct ArticleList: Decodable {
    public var articles: [Article]
}

