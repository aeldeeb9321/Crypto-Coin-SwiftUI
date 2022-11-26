//
//  TopMoversView.swift
//  SwiftCoin
//
//  Created by Ali Eldeeb on 11/25/22.
//

import SwiftUI

struct TopMoversView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Top Movers")
                .font(.headline)
            
            ScrollView(.horizontal){
                //By having some of the cell cut off it indicates to the user that it is a scrollable view which is a nice UI trick 
                HStack(spacing: 16){
                    //anytime you create views in SWiftUI with a for each loop, each view needs its own UID
                    ForEach(0..<5, id: \.self) { _ in
                        TopMoversItemView()
                    }
                    
                }
            }
        }.padding()
    }
}

struct TopMoversView_Previews: PreviewProvider {
    static var previews: some View {
        TopMoversView()
    }
}
