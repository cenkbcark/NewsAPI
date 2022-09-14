//
//  CategoriesPage.swift
//  NewsAPI
//
//  Created by Cenk Bahadır Çark on 13.09.2022.
//

import UIKit

final class CategoriesPage: UIViewController {
    
    @IBOutlet weak private var categoryCollectionView: UICollectionView!
    
    var CategoryList : [Categories]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        CategoryList = CategoryModel.shared.createCategoryArray()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toCategory"{
            let category = sender as? Categories
            let destinationVC = segue.destination as! CategoryPage
            destinationVC.selectedCategory = category?.categoryName
        }
    }
}

extension CategoriesPage: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CategoryList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as? CategoriesCell{
            
            let category = CategoryList![indexPath.row]
            cell.configureCell(from: cell)
            cell.setCategory(from: category)
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "toCategory", sender: CategoryList![indexPath.row])
    }
}
