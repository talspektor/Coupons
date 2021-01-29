//
//  AppView.swift
//  CouponSystem
//
//  Created by Tal talspektor on 16/01/2021.
//

import SwiftUI

struct AppView: View {
    @EnvironmentObject var user: CustomerObservable
    var body: some View {
        if user.isLoggedIn {
            HomeView()
        } else {
            LoginView()
        }
//        TabView {
//            CouponsForOrder()
//                .tabItem {
//                    Image(systemName: "list.dash")
//                    Text("Coupons")
//                }
//            OrderView()
//                .tabItem {
//                    Image(systemName: "square.and.pencil")
//                    Text("Order")
//                }
//            MyCoupons()
//                .tabItem {
//                    Image(systemName: "star.fill")
//                    Text("My Coupons")
//                }
//        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
