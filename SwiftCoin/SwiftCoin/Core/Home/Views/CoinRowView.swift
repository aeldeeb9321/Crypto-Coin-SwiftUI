//
//  CoinRowView.swift
//  SwiftCoin
//
//  Created by Ali Eldeeb on 11/25/22.
//

import SwiftUI
import Kingfisher

struct CoinRowView: View {
    let coin: Coin
    var body: some View {
        HStack{
            //market cap rank
            Text("\(coin.marketCapRank)")
                .font(.caption)
                .foregroundColor(.gray)
            //image
            KFImage(URL(string: coin.image))
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)
                .padding(8)
            //coin name info
            VStack(alignment: .leading, spacing: 4){
                Text(coin.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                Text(coin.symbol)
                    .font(.caption)
                    .padding(.leading, 6)
            }
            Spacer()
            
            //coin price info
            VStack(alignment: .trailing, spacing: 4){
                Text(coin.currentPrice.toCurrency())
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                Text(coin.priceChangePercentage24H.toPercent() )
                    .font(.caption)
                    .padding(.leading, 6)
                    .foregroundColor(getColor())
            }
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 4)
    }
    
    private func getColor() -> Color?{
        return coin.priceChangePercentage24H < 0 ? .red: .green
    }
}

//struct CoinRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        CoinRowView()
//    }
//}
