//
//  HomePageViewModel.swift
//  NewsAPI
//
//  Created by Cenk Bahadır Çark on 14.09.2022.
//

import Foundation

func getTopHeadLines(completion: @escaping (([News]) -> ())){
    
    let url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=90e71a2d31f74f088a5256fca2b14568"
    
    NetworkService.shared.fetchData(from: url) { newsResponse in
        
        guard let news = newsResponse.articles else {return}
        completion(news)
    }
    
}

func setTopHeadLines(from homePage: HomePage){
    
    getTopHeadLines { news in
        homePage.HeadlinesNewsList = news
        homePage.topHeadlinesCollectionView.reloadData()
    }
    
}
