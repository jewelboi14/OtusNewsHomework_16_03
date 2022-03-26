//
//  ArticleDetailView.swift
//  OtusNewsHomework_16_03
//
//  Created by Михаил on 26.03.2022.
//

import SwiftUI

struct ArticleDetailView: View {
    
    //MARK: - Stored Properties
    
    var article: Article
    
    @EnvironmentObject var routeModel: NavigationContainerViewModel
    
    //MARK: - View Properties
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                GeometryReader { geo in
                    AsyncImage(url: URL(string: article.urlToImage ?? ""), content: { image in
                        switch image {
                        case .success(let image):
                            image
                                .resizable()
                                .modifier(StickToTopModifier(proxy: geo))
                        case .empty:
                            ProgressView()
                                .scaledToFit()
                                .frame(width: geo.size.width, height: 300)
                        @unknown default:
                            Image(systemName: "questionmark.circle")
                                .resizable()
                                .modifier(StickToTopModifier(proxy: geo))
                        }
                    })
                }
                .frame(height: 300)
                GeometryReader { geo in
                    VStack {
                        Text((article.content ?? article.articleDescription) ?? "")
                        Button {
                            routeModel.push(screenView: LazyView(Text("last screen")).toAnyView())
                        } label: {
                            Text("Push next")
                                .font(.system(size: 30, weight: .bold, design: .rounded))
                                .foregroundColor(Color("cellColor"))
                        }

                    }
                    .frame(width: geo.size.width, height: 400, alignment: .top)
                    .background(.white)
                    
                }
            }
        }
        .coordinateSpace(name: "Scroll")
    }
}

//MARK: - StickToTopModifier

struct StickToTopModifier: ViewModifier {
    var proxy: GeometryProxy
    func body(content: Content) -> some View {
        content
            .aspectRatio(contentMode: .fill)
            .frame(width: proxy.size.width,
                   height: proxy.frame(in: .named("Scroll")).minY + proxy.size.height,
                   alignment: .top)
            .offset(y: -proxy.frame(in: .named("Scroll")).minY)
    }
}

//MARK: - Previews

struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailView(article: Article(id: UUID(), source: Source(id: "123", name: "123"), author: "MikhaelYurov", title: "Title", articleDescription: "w", url: "123", urlToImage: "123", publishedAt: "11.01", content: "Whales are a widely distributed and diverse group of fully aquatic placental marine mammals. They are an informal grouping within the infraorder Cetacea, which usually excludes dolphins and porpoises. Whales, dolphins and porpoises belong to the order Cetartiodactyla, which consists of even-toed ungulates. Their closest non-cetacean living relatives are the hippopotamuses, from which they and other cetaceans diverged about 54 million years ago. The two parvorders of whales, baleen whales (Mysticeti) and toothed whales (Odontoceti), are thought to have had their last common ancestor around 34 million years ago. Whales consist of eight extant families: Balaenopteridae (the rorquals), Balaenidae (right whales), Cetotheriidae (the pygmy right whale), Eschrichtiidae (the grey whale), Monodontidae (belugas and narwhals), Physeteridae (the sperm whale), Kogiidae (the dwarf and pygmy sperm whale), and Ziphiidae (the beaked whales)"))
    }
}
