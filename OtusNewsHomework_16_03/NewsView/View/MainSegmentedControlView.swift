//
//  MainSegmentedControlView.swift
//  OtusNewsHomework_16_03
//
//  Created by developer on 18.03.2022.
//

import SwiftUI

struct MainSegmentedControlView: View {
    
    //MARK: - Stored Properties
    
    @ObservedObject var viewModel = ArticleListViewModel()
    
    //MARK: - View Properties
     
    var body: some View {
        VStack {
            Picker("News Category", selection: $viewModel.segmentedControlSelection) {
                Text("Sports")
                    .tag(0)
                Text("Science")
                    .tag(1)
                Text("Politics")
                    .tag(2)
            }
            .pickerStyle(.segmented)
            switch viewModel.segmentedControlSelection {
            case 0:
                ArticleListView(viewModel: viewModel)
            case 1:
                ArticleListView(viewModel: viewModel)
            default:
                ArticleListView(viewModel: viewModel)
            }
            
        }
    }
}

//struct MainSegmentedControlView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainSegmentedControlView()
//    }
//}
