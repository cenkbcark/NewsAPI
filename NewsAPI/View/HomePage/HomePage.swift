//
//  ViewController.swift
//  NewsAPI
//
//  Created by Cenk Bahadır Çark on 13.09.2022.
//

import UIKit

final class HomePage: UIViewController {

    @IBOutlet weak var topHeadlinesCollectionView: UICollectionView!
    
    var HeadlinesNewsList : [News]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topHeadlinesCollectionView.dataSource = self
        topHeadlinesCollectionView.delegate = self
        
        setTopHeadLines(from: self)

    }


}
extension HomePage: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return HeadlinesNewsList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = topHeadlinesCollectionView.dequeueReusableCell(withReuseIdentifier: "topHeadlinesCell", for: indexPath) as? TopHeadlinesCell{
            
            let headLine = HeadlinesNewsList![indexPath.row]
            cell.setTopNews(from: headLine)
            cell.layer.cornerRadius = 10.0
            return cell
        }
        
        return UICollectionViewCell()
    }
}
