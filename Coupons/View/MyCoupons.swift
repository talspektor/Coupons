//
//  MyCoupons.swift
//  CouponSystem
//
//  Created by Tal talspektor on 16/01/2021.
//

import SwiftUI

struct MyCoupons: View {
    @EnvironmentObject var order: OrderCoupon
    //TODO: use real data
    var sections = mockSections
    
    var body: some View {
        //TODO: use this view genericly
        NavigationView {
            List {
                ForEach(order.myCouopns ?? [CategoryCoupons]()) { categoryCoupons in
                    Section(header: Text(categoryCoupons.category.rawValue)
                                .font(.title2)
                                .foregroundColor(.blue)) {
                        ForEach(categoryCoupons.coupons) { coupon in
                            CouponItemView(isForOrder: false, coupon: coupon)
                        }
                    }
                }
            }.navigationTitle("My Coupons")
            .listStyle(GroupedListStyle())
        }
    }
}

struct MyCoupons_Previews: PreviewProvider {
    static var previews: some View {
        MyCoupons()
    }
}
