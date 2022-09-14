//
//  SearchCell.swift
//  NewsAPI
//
//  Created by Cenk Bahadır Çark on 14.09.2022.
//

import UIKit

class SearchCell: UICollectionViewCell {
    
    @IBOutlet weak private var searchImage: UIImageView!
    @IBOutlet weak private var searchTitle: UILabel!
    
    func setNews(from news: News){
        searchImage.layer.cornerRadius = 10.0
        searchTitle.text = news.title
        if news.urlToImage == nil {
            searchImage.kf.setImage(with: URL(string: "https://www.creativefabrica.com/wp-content/uploads/2018/12/Breaking-News-Vector-Illustration-by-indostudio-580x386.jpg"))
        }else{
            searchImage.kf.setImage(with: URL(string: news.urlToImage!))
        }
    }
    
}
