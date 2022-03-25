//
//  ArticleListView.swift
//  OtusNewsHomework_16_03
//
//  Created by developer on 21.03.2022.
//

import SwiftUI

struct ArticleListView: View {
    
    //MARK: - Stored Properties
    
    @ObservedObject var viewModel: ArticleListViewModel
    
    //MARK: - View Properties
    
    var body: some View {
        List(viewModel.articleList) {
            let isLastCharacter = viewModel.articleList.isLastItem($0)
            ArticleCell(article: $0)
                .listRowSeparator(.hidden)
                .onAppear {
                    if isLastCharacter && viewModel.canLoad {
                        viewModel.fetchArticles()
                    }
                }
        }
        .onAppear {
            viewModel.articleList = []
            viewModel.fetchArticles()
        }
        .background(.white)
        .listStyle(.plain)
        
    }
}

struct ArticleListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView(viewModel: ArticleListViewModel())
    }
}
