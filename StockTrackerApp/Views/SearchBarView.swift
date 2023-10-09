//
//  SearchBarView.swift
//  StockTrackerApp
//
//  Created by admin on 10/2/23.
//

import SwiftUI

struct SearchBarView: View {
    @State private var searchSymbol: String = ""
    var body: some View {
        VStack {
            TextField("Search Stocks", text: $searchSymbol)
                .bold()
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(Color.royalBlue, lineWidth: 2)
                    )
                .padding()
                .textInputAutocapitalization(.never)
            Divider()
            
            ScrollView{
                VStack{
                    PreviousStockSearchedCell(stock:"NKE", description: "a sporty company")
                    PreviousStockSearchedCell(stock: "MUX", description: "a mining company")
                }
            }
            Spacer()
        }
    }
}

#Preview {
    SearchBarView()
}
