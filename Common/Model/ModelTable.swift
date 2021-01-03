//
//  ModelTable.swift
//  NewsApi
//
//  Created by Азат Киракосян on 07.12.2020.
//

import Foundation

struct ModelTable {
    
    let titleNews: String?
    var imageNews: URL?
    let descriptionNew: String?
    let author: String?
    let article: Article
    
    init(article: Article) {
        self.article = article
        
        titleNews = article.title
        descriptionNew = article.articleDescription
        author = article.author
        imageNews = article.urlToImage
      
    }


}
