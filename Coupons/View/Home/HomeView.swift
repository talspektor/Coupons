//
//  HomeView.swift
//  Coupons
//
//  Created by Tal talspektor on 28/01/2021.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        TabView {
            CouponsForOrder()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Coupons")
                }
            OrderView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Order")
                }
            MyCoupons()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("My Coupons")
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
