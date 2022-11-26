//
//  HomeViewModel.swift
//  SwiftCoin
//
//  Created by Ali Eldeeb on 11/25/22.
//

import SwiftUI

//THis home vm will be responsible for communicating with the api, downloading coin data then updating our UI
class HomeViewModel: ObservableObject{
    @Published var coins = [Coin]()
    @Published var topMovingCoins = [Coin]()
    private let session = URLSession(configuration: .default)
    
    //When we initialize the homeViewModel it will call the fetchCoinData
    init(){
        fetchCoinData()
    }
    func fetchCoinData(){
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc%20&per_page=100&page=1&sparkline=true&price_change_percentage=24h"
        
        guard let url = URL(string: urlString ) else{ return }
        
        session.dataTask(with: url) { data, reponse, error in
            guard error == nil else{ fatalError(error!.localizedDescription)}
            guard let reponse = reponse as? HTTPURLResponse else{ return }
            guard(200...299).contains(reponse.statusCode) else{
                assertionFailure("DEBUG: Recieve invalid server response: \(reponse.statusCode)")
                return
            }
            
            guard let data = data else{ return }
            let decoder = JSONDecoder()
            
            do{
                let coinData = try decoder.decode([Coin].self, from: data)
                DispatchQueue.main.async {
                    self.coins = coinData
                    self.configureTopMovingCoins()
                }
                //completion(coinData)
            }catch let error{
                print("DEBUG: \(error.localizedDescription)")
            } 
        }.resume()
    }
    
    func configureTopMovingCoins(){
        let topMovers = coins.sorted(by: {abs($0.priceChangePercentage24H) > abs($1.priceChangePercentage24H) })
        self.topMovingCoins = Array(topMovers.prefix(10))
    }
}
