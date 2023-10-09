//
//  previousStockSearchedCell.swift
//  StockTrackerApp
//
//  Created by admin on 10/2/23.
//

import SwiftUI

struct PreviousStockSearchedCell: View {
    let stock: String
    let description: String
    var body: some View {
        HStack{
            Text(stock)
                .font(.title)
                .bold()
                .foregroundColor(.royalBlue)
            Spacer(minLength: 0)
            
            Text(description)
                .foregroundColor(.gray)
        }
        .padding()
        .background(.white)
        Divider()
    }
}

#Preview {
    PreviousStockSearchedCell(stock: "AAPL", description:" Apple Incorp")
}
