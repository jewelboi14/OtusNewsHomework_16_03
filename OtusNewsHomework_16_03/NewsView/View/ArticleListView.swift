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
    @EnvironmentObject var routeModel: NavigationContainerViewModel
    
    //MARK: - View Properties
    
    var body: some View {
        List(viewModel.articleList) { article in
            let isLastCharacter = viewModel.articleList.isLastItem(article)
            ArticleCell(article: article)
                .listRowSeparator(.hidden)
                .onAppear {
                    if isLastCharacter && viewModel.canLoad {
                        viewModel.fetchArticles()
                    }
                }
                .onTapGesture {
                    routeModel.push(screenView: LazyView(ArticleDetailView(article: article)).toAnyView())
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
