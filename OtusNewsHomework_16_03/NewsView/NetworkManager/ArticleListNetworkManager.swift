//
//  ArticleListNetworkManager.swift
//  OtusNewsHomework_16_03
//
//  Created by developer on 18.03.2022.
//

import Foundation

final class ArticleListNetworkManager {
    
    //MARK: - Networking methods
    
    private let apiKey = "09b27589cedc4ee0997888c6e70a877e"
    
    static let shared = ArticleListNetworkManager()
    
    func fetchNewsBy(page: Int, category: String, completion: @escaping (News?, Error?) -> Void) {
        
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&\(page)=1&category=\(category)&apiKey=\(apiKey)")
        else { return }
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                completion(nil, error)
                return
            }
            do {
                let decodedData = try JSONDecoder().decode(News.self, from: data)
                completion(decodedData, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
    
}
