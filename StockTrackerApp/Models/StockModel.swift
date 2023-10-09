//
//  StockModel.swift
//  StockTrackerApp
//
//  Created by admin on 09/28/23.
//

import Foundation

struct StockModel: Hashable {
    let symbol: String // AAPL
    let description: String? // Apple Incor
    let currentPrice: Double? // 112.12
    let percentageChange: Double? // %1.45
    let candles: [CGFloat]
}
