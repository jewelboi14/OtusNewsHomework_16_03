//
//  ArticleListNetworkService.swift
//  OtusNewsHomework_16_03
//
//  Created by developer on 18.03.2022.
//

import Foundation

final class ArticleListNetworkService {
    
    //MARK: - Networking methods
    
    func fetchNewsBy(page: Int, category: String, completion: @escaping (News?, Error?) -> Void) {
        guard let url = URL(string: URLManager.getMainUrl(page: page, category: category))
        else { return }
        print(url)
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
