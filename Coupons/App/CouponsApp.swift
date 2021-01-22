//
//  CouponsApp.swift
//  Coupons
//
//  Created by Tal talspektor on 22/01/2021.
//

import SwiftUI

@main
struct CouponsApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    let orederCoupon: OrderCoupon = {
        let order = OrderCoupon()
        order.fetchCoupons()
        order.fetchMyCoupons()
        return order
    }()
    var body: some Scene {
        WindowGroup {
            AppView()
                .environmentObject(orederCoupon)
        }
    }
}
