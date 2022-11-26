//
//  AllCoinsView.swift
//  SwiftCoin
//
//  Created by Ali Eldeeb on 11/25/22.
//

import SwiftUI

struct AllCoinsView: View {
    var body: some View {
        VStack(alignment: .leading,spacing: 10){
            Text("All Coins")
                .font(.headline)
                .padding()
            HStack{
                Text("Coin")
                
                Spacer()
                
                Text("Price")
                    
            }
                .padding(.horizontal, 6)
                .font(.caption)
                .foregroundColor(.gray)
            
            ScrollView{
                VStack{
                    ForEach((0..<50)) { _ in
                        CoinRowView()
                    }
                }
            }
            
        }
    }
}

struct AllCoinsView_Previews: PreviewProvider {
    static var previews: some View {
        AllCoinsView()
    }
}
