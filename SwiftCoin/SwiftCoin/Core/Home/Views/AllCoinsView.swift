//
//  AllCoinsView.swift
//  SwiftCoin
//
//  Created by Ali Eldeeb on 11/25/22.
//

import SwiftUI

struct AllCoinsView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack(alignment: .leading,spacing: 10){
            Text("All Coins")
                .font(.headline)
                .padding()
            labelSetupView()
            
            ScrollView{
                VStack{
                    ForEach(viewModel.coins) { coin in
                        CoinRowView(coin: coin)
                    }
                }
            }
            
        }
    }
}

struct labelSetupView: View {
    var body: some View {
        HStack{
            Text("Coin")
            
            Spacer()
            
            Text("Price")
            
        }
        .padding(.horizontal, 6)
        .font(.caption)
        .foregroundColor(.gray)
    }
}
