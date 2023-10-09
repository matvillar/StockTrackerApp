//
//  ContentView.swift
//  StockTrackerApp
//
//  Created by admin on 9/21/23.
//

import SwiftUI

struct ContentView: View {
    @State private var stocksModel: StocksModel = StocksModel()
    @State private var isShowingStocksSearch: Bool = false
    var body: some View {

            VStack {
                HeaderView(showSheet: $isShowingStocksSearch)
                    .padding()
                   
               
                
                PortfolioValueView(stocksModel: stocksModel)
                    .padding()
                    .shadow(radius: 5)
                
                WatchListView(stocksModel: stocksModel)
                    .padding()
                Spacer()
            }
            .ignoresSafeArea(.all, edges: .bottom)
            .sheet(isPresented: $isShowingStocksSearch) {
             SearchBarView()
            }
        
            
        }
    }


#Preview {
    ContentView()
}
