//
//  StocksModel.swift
//  StockTrackerApp
//
// Created by admin on 09/28/23.
//

import Foundation
import SwiftUI
class StocksModel: ObservableObject {
    var tickers = ["AAPL", "NVDA", "MSFT", "NKE", "NFLX"]
    
    @Published var stocks: [StockModel] = []
    
    
    init(){
        self.getStockData()
    }
    
    public func getStockData() {
        print("Fetching stock data for tickers: \(tickers)")
        
        for ticker in tickers {
            print("Fetching data for ticker: \(ticker)")
            APIReq.instance.getSymbolSearch(searchQuery: ticker) { returnedSymbols in
                APIReq.instance.getSymbolQuote(symbol: ticker) { returnedQuote in
                    APIReq.instance.getCandleSticks(symbol: ticker, hourLength: 12) { returnedCandles in
                        let candleArray: [CGFloat] = returnedCandles?.c.map {CGFloat($0)} ?? []
                        
                        let stockInfo = returnedSymbols?.result[0]
                        
                        let newStock = StockModel(symbol: ticker, description: stockInfo?.description, currentPrice: returnedQuote?.c, percentageChange: returnedQuote?.dp, candles: candleArray)
                        
                        DispatchQueue.main.async {
                            self.stocks.append(newStock)
                            
                        }
                    }
                }
            }
        }
    }
}
