//
//  Double.swift
//  SwiftCoin
//
//  Created by Ali Eldeeb on 11/26/22.
//

import Foundation

extension Double{
    private var currencyFormatter: NumberFormatter{
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    private var percentFormatter: NumberFormatter{
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    //helper method to utilize the numberFormatter in order to help it format our prices
    func toCurrency() -> String{
        return currencyFormatter.string(for: self) ?? "$0.00"
    }
    
    func toPercent() -> String{
        return ((percentFormatter.string(for: self) ?? "0.00%") + "%")
    }
}
