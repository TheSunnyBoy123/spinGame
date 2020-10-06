//
//  cardView.swift
//  spinGame
//
//  Created by Rajesh Patel on 05/10/2020.
//

import SwiftUI

struct cardView: View {
    
    @Binding var symbol:String
    @Binding var background:Color
    
    var body: some View {
        Image(symbol)
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .background(background.opacity(0.15))
            .cornerRadius(20)
    }
}



struct cardView_Previews: PreviewProvider {
    static var previews: some View {
        cardView(symbol: Binding.constant("cherry"), background: Binding.constant(Color.green))
    }
}
