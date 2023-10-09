//
//  StockSection.swift
//  StockTrackerApp
//
//  Created by admin on 09/27/23.
//

import SwiftUI

struct PortfolioValueView: View {
    @StateObject var stocksModel: StocksModel
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Portfolio Value")
                .foregroundColor(Color.columbiaBlue)
                .font(.title3)
            
            HStack(alignment: .top){
                Text("$\(String(format: "%.2f", stocksModel.stocks.map({ $0.currentPrice ?? 0.0 }).reduce(0.0, +)))")
                    .bold()
                    .foregroundColor(.white)
                    .font(.system(size: 50))
             
                
                Text("2.1%")
                    .foregroundColor(.carrotOrange)
                    .font(.title3)
                    .bold()
            }
            
            Spacer()
            HStack{
                Button(action: {
                    
                }, label: {
                    Text("Deposit")
                        .foregroundColor(.white)
                        .padding()
                        .padding(.horizontal)
                        .font(.title3)
                        .bold()
                  
                      
                        .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.carrotOrange)
                        )
                }) 
                Spacer()
                Button(action: {
                    
                }, label: {
                    Text("Withdrawn")
                        .foregroundColor(.columbiaBlue)
                        .padding()
                        .font(.title3)
                        .bold()
                  
                      
                        .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.columbiaBlue)
                        )
                })
            }
        }
        .padding()

        .frame(height: UIScreen.main.bounds.height/4)
        .frame(maxWidth: .infinity)
        .background(
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.royalBlue)
        )
    }
}
//
//#Preview {
//    PortfolioValueView()
//}
