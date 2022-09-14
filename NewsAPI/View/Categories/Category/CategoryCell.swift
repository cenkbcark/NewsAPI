//
//  CategoryCell.swift
//  NewsAPI
//
//  Created by Cenk Bahadır Çark on 13.09.2022.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    @IBOutlet weak private var newTitle: UILabel!
    @IBOutlet weak private var newImage: UIImageView!
    @IBOutlet weak private var newSource: UILabel!
    @IBOutlet weak private var newDate: UILabel!
    
    func setNews(from news: News){
        newTitle.text = news.title
        newSource.text = news.source?.name
        newDate.text = news.publishedAt
        if news.urlToImage == nil {
            newImage.kf.setImage(with: URL(string:"https://www.creativefabrica.com/wp-content/uploads/2018/12/Breaking-News-Vector-Illustration-by-indostudio-580x386.jpg"))
        }else{
            newImage.kf.setImage(with: URL(string: news.urlToImage!))
        }
    }
    
    
}
