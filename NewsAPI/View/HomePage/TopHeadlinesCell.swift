//
//  TopHeadlinesCell.swift
//  NewsAPI
//
//  Created by Cenk Bahadır Çark on 14.09.2022.
//

import UIKit

class TopHeadlinesCell: UICollectionViewCell {
    @IBOutlet weak private var newImage: UIImageView!
    @IBOutlet weak private var newTitle: UILabel!
    @IBOutlet weak private var newSource: UILabel!
    @IBOutlet weak private var newDate: UILabel!
    
    
    
    
    func setTopNews(from news: News){
        newImage.layer.cornerRadius = 10.0
        newTitle.text = news.title
        newSource.text = news.source?.name ?? "Unknown"
        newDate.text = news.publishedAt
        if news.urlToImage == nil {
            newImage.kf.setImage(with: URL(string: "https://www.creativefabrica.com/wp-content/uploads/2018/12/Breaking-News-Vector-Illustration-by-indostudio-580x386.jpg"))
        }else{
            newImage.kf.setImage(with: URL(string: news.urlToImage!))
        }
    }
}
