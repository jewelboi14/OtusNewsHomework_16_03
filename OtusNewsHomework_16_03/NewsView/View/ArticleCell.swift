//
//  ArticleCell.swift
//  OtusNewsHomework_16_03
//
//  Created by developer on 21.03.2022.
//

import SwiftUI

struct ArticleCell: View {
    
    //MARK: - Stored Properties
    
    @State var article: Article
    
    //MARK: - View Properties
    
    var body: some View {
        ZStack(alignment: .center) {
            Rectangle()
                
                .frame(width: 345, height: 130, alignment: .center)
                .background(Color("cellColor"))
                .foregroundColor(.clear)
                .cornerRadius(15)
                .shadow(color:
                            Color("cellColor")
                            .opacity(0.4),
                        radius: 0,
                        x: 0,
                        y: 7)
            VStack {
                HStack {
                    Text(article.title)
                        .foregroundColor(.white)
                    Spacer()
                }
            }
            .frame(width: 330, height: 130, alignment: .center)
        }
    }
}

//MARK: - Preview

struct ArticleCell_Previews: PreviewProvider {
    static var previews: some View {
        ArticleCell(article: Article(source: Source(id: "", name: ""), author: "", title: "wewerwer", articleDescription: "", url: "", urlToImage: "", publishedAt: "", content: ""))
    }
}
