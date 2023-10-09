//
//  HeaderView.swift
//  StockTrackerApp
//
//  Created by Matias Villar on 09/22/23.
//

import SwiftUI

struct HeaderView: View {
    @Binding var showSheet: Bool
    var body: some View {
        HStack{
            Text("My Portfolio")
                .font(.largeTitle).bold()
                .foregroundStyle(Color.royalBlue)
            Spacer()
            Button(action: {
                showSheet.toggle()
            }, label: {
                Image(systemName: "plus.magnifyingglass")
                    .foregroundColor(.carrotOrange)
                    .padding(7)
                    .font(.system(size: 20))
                    .bold()
                    .background(Color.royalBlue)
                    .cornerRadius(50)
            })
        }
    }
}

//#Preview {
//    HeaderView()
//        .padding()
//}
