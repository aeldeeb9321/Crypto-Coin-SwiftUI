//
//  CoinRowView.swift
//  SwiftCoin
//
//  Created by Ali Eldeeb on 11/25/22.
//

import SwiftUI

struct CoinRowView: View {
    let coin: Coin
    var body: some View {
        HStack{
            //market cap rank
            Text("\(coin.marketCapRank ?? 1)")
                .font(.caption)
                .foregroundColor(.gray)
            //image
            Image(systemName: "bitcoinsign.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)
                .padding(8)
            //coin name info
            VStack(alignment: .leading, spacing: 4){
                Text("\(coin.name)")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                Text("\(coin.symbol)")
                    .font(.caption)
                    .padding(.leading, 6)
            }
            Spacer()
            
            //coin price info
            VStack(alignment: .trailing, spacing: 4){
                Text("$\(coin.currentPrice)")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                Text("\(coin.priceChangePercentage24H)%")
                    .font(.caption)
                    .padding(.leading, 6)
                    .foregroundColor(.red)
            }
        }
        .padding(.horizontal, 5)
        .padding(.vertical, 4)
    }
}

//struct CoinRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        CoinRowView()
//    }
//}
