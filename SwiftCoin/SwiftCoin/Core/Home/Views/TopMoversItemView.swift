//
//  TopMoversItemView.swift
//  SwiftCoin
//
//  Created by Ali Eldeeb on 11/25/22.
//

import SwiftUI
import Kingfisher

struct TopMoversItemView: View {
    let coin: Coin
    var body: some View {
        VStack(alignment: .leading){
            //image
            KFImage(URL(string: coin.image))
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)
                .padding(8)
            //coin info
            HStack(spacing: 2){
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .fontWeight(.bold)
                
                Text(coin.currentPrice.toCurrency())
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            //coin percent change
            Text(coin.priceChangePercentage24H.toPercent())
                .font(.title2)
                .foregroundColor(getColor())
        }.frame(width: 140, height: 140)
            .background(Color("itemBackgroundColor"))
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.systemGray4), lineWidth: 2)
            }
    }
    
    private func getColor() -> Color?{
        return coin.priceChangePercentage24H < 0 ? .red: .green
    }
    
}

//struct TopMoversItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        TopMoversItemView()
//    }
//}
