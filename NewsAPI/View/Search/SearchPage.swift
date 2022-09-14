//
//  SearchPage.swift
//  NewsAPI
//
//  Created by Cenk Bahadır Çark on 13.09.2022.
//

import UIKit
import Kingfisher

final class SearchPage: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchCollectionView: UICollectionView!
    
    var searchNewsList : [News]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchCollectionView.delegate = self
        searchCollectionView.dataSource = self
        searchBar.delegate = self
        
        
        
        
        
    }
    
    private func searchData(searchWord: String,completion: @escaping (([News]) -> ())){
        
        let url = "https://newsapi.org/v2/everything?q=\(searchWord)&from=2022-09-13&sortBy=popularity&apiKey=90e71a2d31f74f088a5256fca2b14568"
        
        NetworkService.shared.fetchData(from: url) { newsResponse in
            
            guard let news = newsResponse.articles else {return}
            completion(news)
        }
    }
    


}
extension SearchPage: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchNewsList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = searchCollectionView.dequeueReusableCell(withReuseIdentifier: "SearchCell", for: indexPath) as? SearchCell{
            
            let searchNew = searchNewsList![indexPath.row]
            cell.setNews(from: searchNew)
            cell.layer.cornerRadius = 10.0
            return cell
        }
        
        
        return UICollectionViewCell()
    }
    
    
}
extension SearchPage: UISearchBarDelegate{
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        var searchText = searchBar.text
        
        if searchText != "" {
            searchData(searchWord: searchText!) { news in
                self.searchNewsList = news
                self.searchCollectionView.reloadData()
            }
        }else{
            self.searchNewsList?.removeAll()
            self.searchCollectionView.reloadData()
        }
    }
}
