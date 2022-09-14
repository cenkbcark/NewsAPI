//
//  CategoryPage.swift
//  NewsAPI
//
//  Created by Cenk Bahadır Çark on 13.09.2022.
//

import UIKit
import Kingfisher

final class CategoryPage: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var categoryNewsList : [News]? = []
    var selectedCategory: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        if selectedCategory != nil {
            setDataCategory(from: self, selectedCategory: selectedCategory!)
        }
        
    }


}
extension CategoryPage: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryNewsList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as? CategoryCell{
            
            let new = categoryNewsList![indexPath.row]
            cell.setNews(from: new)
            cell.layer.cornerRadius = 10.0
            return cell
        }
        return UICollectionViewCell()
    }
}
