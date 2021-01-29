//
//  ContentView.swift
//  CouponSystem
//
//  Created by Tal talspektor on 14/01/2021.
//

import SwiftUI
import CoreData

struct CouponsForOrder: View {
    @EnvironmentObject var order: CustomerObservable

    var body: some View {
        NavigationView {
            List {
                ForEach(order.coupons ?? [CategoryCoupons]()) { categoryCoupons in
                    Section(header: Text(categoryCoupons.category.rawValue)
                                .font(.title2)
                                .foregroundColor(.blue)) {
                        ForEach(categoryCoupons.coupons) { coupon in
                            CouponItemView(isForOrder: true, coupon: coupon)
                        }
                    }
                }
            }.navigationTitle("iCoupons")
            .listStyle(GroupedListStyle())
        }
    }
}

struct CouponsForOrder_Previews: PreviewProvider {
    static var previews: some View {
        CouponsForOrder()
    }
}
