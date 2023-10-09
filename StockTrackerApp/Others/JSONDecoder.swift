//
//  JSONDecoder.swift
//  StockTrackerApp
//
//   Created by admin on 09/28/23.
//

import Foundation
// This is what we get from api
//{
//    "c": 171.6399,
//    "d": -2.1101,
//    "dp": -1.2144,
//    "h": 173.63,
//    "l": 170.82,
//    "o": 173.32,
//    "pc": 173.75,
//    "t": 1696343603
//}


struct Quote: Decodable {
    let c: Double
    let d: Double
    let dp: Double
    let l: Double
    let o: Double
    let pc: Double
    let t: Double
    
}

struct StockTickerSearch: Decodable {
    let count: Int
    let result: [StockTicker]
}

//"result": [
//{
//"description": "APPLE INC",
//"displaySymbol": "AAPL",
//"symbol": "AAPL",
//"type": "Common Stock"
//},

struct StockTicker: Decodable, Hashable {
    let description: String
    let displaySymbol: String
    let symbol: String
    let type: String
}

struct Candles: Decodable{
    let c: [Double]
}

