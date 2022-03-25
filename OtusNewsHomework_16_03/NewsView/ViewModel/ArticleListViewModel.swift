//
//  ArticleListViewModel.swift
//  OtusNewsHomework_16_03
//
//  Created by developer on 21.03.2022.
//

import Foundation
import SwiftUI

final class ArticleListViewModel: ObservableObject {
    
    //MARK: - Published Properties
    
    @Published var articleList = [Article]()
    
    @Published var segmentedControlSelection = 0
    
    //MARK: - Stored Properties
    
    var categories = ["sports", "science", "politics"]
    var canLoad: Bool = true
    private var page: Int  = 1
    private var totalResults: Int = .max
    
//    class CharactersListViewModel : ObservableObject {
//        @Published var list: [ModelCharacter] = []
//        var canLoad: Bool = true
//
//        private var page: Int = 1
//        private var total: Int = .max
//
//        func fetchCharacters() {
//            guard canLoad == true else { return }
//            guard total > list.count else { return }
//            canLoad = false
//            CharactersAPI.getAllCharacters(page: page) { [weak self]  data, error in
//                self?.total = data?.info.count ?? .max
//                if error == nil {
//                    self?.list.append(contentsOf: (data?.results ?? []))
//                    self?.page += 1
//                } else {
//                    print("Error \(error)")
//                }
//                self?.canLoad = true
//            }
//
//        }
//    }
    
    
    
    //MARK: - Networking Methods
    
    func fetchArticles() {
        guard canLoad == true else { return }
        guard totalResults > articleList.count else { return }
        canLoad = false
        ArticleListNetworkManager.shared.fetchNewsBy(page: page,
                                                     category: categories[segmentedControlSelection]) { [weak self] news, _ in
            if let articles = news?.articles,
                let totalResults = news?.totalResults {
                self?.totalResults = totalResults
                self?.page += 1
                DispatchQueue.main.async {
                    self?.articleList.append(contentsOf: articles)
                }
                self?.canLoad = true
            }
        }
    }
}
