//
//  HomeView.swift
//  SwiftCoin
//
//  Created by Ali Eldeeb on 11/25/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false) {
                
                //Top Movers view
                TopMoversView()
                Divider()
                //all coins view
                AllCoinsView()
                
            }.navigationTitle("Live Prices")
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
