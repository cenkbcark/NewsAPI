//
//  DataViewMode.swift
//  NewsAPI
//
//  Created by Cenk Bahadır Çark on 14.09.2022.
//

import Foundation

func getDataCategory(category: String,completion: @escaping (([News]) -> ())){
    
    let url = "https://newsapi.org/v2/top-headlines?country=us&category=\(category)&apiKey=90e71a2d31f74f088a5256fca2b14568"
    
    NetworkService.shared.fetchData(from: url) { newsResponse in
        
        guard let news = newsResponse.articles else {return}
        completion(news)
    }
    
}

func setDataCategory(from categoryPage: CategoryPage,selectedCategory: String){
    
    getDataCategory(category: selectedCategory) { news in
        categoryPage.categoryNewsList = news
        categoryPage.categoryCollectionView.reloadData()
    }
    
}
