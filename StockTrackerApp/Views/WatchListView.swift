//
//  WatchListView.swift
//  StockTrackerApp
//
//   Created by admin on 09/28/23.
//

import SwiftUI

struct WatchListView: View {
    @StateObject var stocksModel: StocksModel
   
    var body: some View {
            
        
            VStack{
                HStack{
                    Text("Watchlist")
                        .font(.title).bold()
                        .foregroundColor(.royalBlue)
                       
                Spacer()
                }
               
                // Stocks
                ScrollView{
                    ForEach(stocksModel.stocks, id: \.self){ stock in
                        StockCardView(stockModel: stock)
                    
                        
                    }
                   
                }
              
            }
            
    }
}

//#Preview {
//    WatchListView()
//}
