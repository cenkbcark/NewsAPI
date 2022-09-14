//
//  NetworkService.swift
//  NewsAPI
//
//  Created by Cenk Bahadır Çark on 13.09.2022.
//

import Foundation


class NetworkService{
    
    static let shared = NetworkService()
    
    func fetchData(from url: String, completion: @escaping (NewsResponseModel) -> ()){
        
        if let url = URL(string: url){
            
            URLSession.shared.dataTask(with: url){data, response, error in
    
                if let data = data {
                    do{
                        let response = try JSONDecoder().decode(NewsResponseModel.self, from: data)
                        DispatchQueue.main.async {
                            completion(response)
                        }
                    }catch{
                        print(String(describing: error))
                    }
                }else{
                    print("no data")
                }
            }.resume()
        }else{
            print("invalid url")
        }
    }
}

