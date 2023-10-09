//
//  APIReq.swift
//  StockTrackerApp
//
//   Created by admin on 09/28/23.
//

import Foundation

class APIReq {
    static let instance = APIReq()
    
    private var url = "https://finnhub.io/api/v1/"
    private var token = "&token=cke25ghr01qq7snp8m2gcke25ghr01qq7snp8m30"
    
    public func getSymbolQuote(symbol: String, handler: @escaping(_ returnedQuote: Quote?) -> ()){
        let query: String = "quote?symbol=\(symbol)"
        let url = URL(string: url + query + token)
        
        if let url = url {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error{
                    // in case we have an error
                    
                    print("error getting quote: \(error)")
                    return
                }
                
                guard let quoteData = data else {
                    print("symbol search invalid")
                    return
                }
                //try? becuase it can fail.
                let returnedQuote = try? JSONDecoder().decode(Quote.self, from: quoteData)
                
               handler(returnedQuote)
            }
            task.resume()
        }
    }
    
    public func getSymbolSearch(searchQuery: String, handler: @escaping(_ returnedSymbols: StockTickerSearch?) -> ()){
        let query: String = "search?q=\(searchQuery)"
        
        let url = URL(string: url + query + token)
        
        if let url = url{
            let task = URLSession.shared.dataTask(with: url){ data, response, error in
                if let error = error{
                    // in case we have an error
                    
                    print("error searching for symbol: \(error)")
                    return
                } else {
                    
                    guard let searchedData = data else {
                        print("symbol search invalid")
                        return
                    }
                    
                    let returnedSymbols = try? JSONDecoder().decode(StockTickerSearch.self, from: searchedData)
                    handler(returnedSymbols)
                }
            }
            task.resume()
        }
    }
    
    public func getCandleSticks(symbol: String, hourLength: Int, handler: @escaping(_ returnedCandles: Candles?) -> ()){
        let endDate = Int(Date().timeIntervalSince1970)
        let startDate = Int((Calendar.current.date(byAdding: .hour, value: -(hourLength), to: Date())?.timeIntervalSince1970 ?? Date().timeIntervalSince1970))
        
        let query = "stock/candle?symbol=\(symbol)&resolution=5&from=\(startDate)&to=\(endDate)"
        
        let url = URL(string: url + query + token)
        
        if let url = url{
            let task = URLSession.shared.dataTask(with: url){ data, response, error in
                if let error = error{
                    // in case we have an error
                    
                    print("error getting candles: \(error)")
                    return
                }
                
                guard let searchCandleData = data else {
                    print("candle data invalid")
                    return
                }
                
                let returnedCandles = try? JSONDecoder().decode(Candles.self, from: searchCandleData )
                handler(returnedCandles)
            }
            task.resume()
        }
        
    }
}
