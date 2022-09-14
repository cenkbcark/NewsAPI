//
//  CategoriesCell.swift
//  NewsAPI
//
//  Created by Cenk Bahadır Çark on 13.09.2022.
//

import UIKit

class CategoriesCell: UICollectionViewCell {
    @IBOutlet weak private var categoryImage: UIImageView!
    @IBOutlet weak private var categoryName: UILabel!
    
    func setCategory(from categories: Categories){
        categoryImage.image = categories.categoryImage
        categoryName.text = categories.categoryName
    }
    
    func configureCell(from cell: CategoriesCell){
        cell.layer.cornerRadius = 15.0
        cell.layer.borderWidth = 2.0
        cell.layer.borderColor = UIColor.black.cgColor
    }
    
}
