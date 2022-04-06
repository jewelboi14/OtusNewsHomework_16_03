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
    
    @Injected var networkService: ArticleListNetworkService?
    
    //MARK: - Stored Properties
    
    var categories = ["sports", "science", "politics"]
    var canLoad: Bool = true
    private var page: Int  = 1
    private var totalResults: Int = .max
    
    //MARK: - Lifecycle
    
    init() {
        networkService = ArticleListNetworkService()
    }
    
    //MARK: - Networking Methods
    
    func fetchArticles() {
        guard canLoad == true else { return }
        guard totalResults > articleList.count else { return }
        canLoad = false
        networkService?.fetchNewsBy(page: page,
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
