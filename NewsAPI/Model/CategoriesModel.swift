//
//  CategoriesModel.swift
//  NewsAPI
//
//  Created by Cenk Bahadır Çark on 13.09.2022.
//

import Foundation
import UIKit


class Categories {
    
     let categoryName : String?
     let categoryImage : UIImage?
    
    init(name: String,image: UIImage){
        self.categoryImage = image
        self.categoryName = name
    }
}

class CategoryModel{
    
    static let shared = CategoryModel()
    
    func createCategoryArray() -> [Categories]{
        
        var tempArray: [Categories] = []
        
        let category1 = Categories(name: "Business", image: UIImage(named: "business")!)
        let category2 = Categories(name: "Entertainment", image: UIImage(named: "entertainment")!)
        let category3 = Categories(name: "General", image: UIImage(named: "general")!)
        let category4 = Categories(name: "Health", image: UIImage(named: "health")!)
        let category5 = Categories(name: "Science", image: UIImage(named: "science")!)
        let category6 = Categories(name: "Sports", image: UIImage(named: "sports")!)
        let category7 = Categories(name: "Technology", image: UIImage(named: "technology")!)
        
        tempArray.append(category1)
        tempArray.append(category2)
        tempArray.append(category3)
        tempArray.append(category4)
        tempArray.append(category5)
        tempArray.append(category6)
        tempArray.append(category7)
        
        return tempArray
 
    }
}


