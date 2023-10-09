//
//  StockCardView.swift
//  StockTrackerApp
//
//   Created by admin on 09/28/23.
//

import SwiftUI

struct StockCardView: View {
    let stockModel: StockModel
    @State private var logoString: String = ""
    
    var body: some View {
        VStack(alignment:.leading){
            HStack{
//                AsyncImage(url: URL(string: "https://logo.clearbit.com/apple.com"))
                AsyncImage(url: URL(string: "https://logo.clearbit.com/\(logoString).com")) { image in
                    image.resizable().aspectRatio(contentMode: .fit).frame(width: 50, height: 50)
                } placeholder: {
                    ProgressView()
                }
                .cornerRadius(10)
     

                
                VStack(alignment: .leading){
                    //Ticker
                    Text(stockModel.symbol)
                        .foregroundColor(.royalBlue)
                        .font(.title)
                        .bold()
                    Text(stockModel.description ?? "Another Stock")
                        .foregroundColor(.gray)
                        .lineLimit(1)
                        .truncationMode(.tail)
                }
                
                Spacer()
                // Percentage
                
                Text(String(format: (stockModel.percentageChange ?? 0.0) >= 0.0 ? "+%.2f%%" : "%.2f%%" , stockModel.percentageChange ?? 0.0))

                    .font(.title2)
                    .bold()
                    .foregroundColor((stockModel.percentageChange ?? 0.0) >= 0.0 ? .mint : .red)
            }
            .padding()
           
            
            HStack{
                Text(String(format: "%.2f", stockModel.currentPrice ?? 0.0))

                    .font(.title)
                    .bold()
                Spacer()
                ChartView(data: stockModel.candles.normalizedValues)
                    .stroke((stockModel.percentageChange ?? 0.0) >= 0.0 ? .mint : .red, lineWidth: 1.5)
                 
                   
            }
            .padding()
        }
        
        .frame(height: UIScreen.main.bounds.height/4)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder(Color.royalBlue, lineWidth: 4)
        )
        .onAppear{
            if let logoString = stockModel.description?.components(separatedBy: " ").first {
                // get the first word in the description
                self.logoString = logoString.lowercased()
                
            }
        }
        

    }
}

//#Preview {
//    StockCardView()
//}
