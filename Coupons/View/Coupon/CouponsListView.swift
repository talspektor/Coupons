//
//  ContentView.swift
//  CouponSystem
//
//  Created by Tal talspektor on 14/01/2021.
//

import SwiftUI
import CoreData

struct CouponsListView: View {
//    @EnvironmentObject var order: CustomerObservable
    
    var sections: [CategoryCoupons]
    var title: String
    var isForOrder: Bool

    var body: some View {
        NavigationView {
            List {
                ForEach(sections) { categoryCoupons in
                    Section(header: Text(categoryCoupons.category.rawValue)
                                .font(.title2)
                                .foregroundColor(.blue)) {
                        ForEach(categoryCoupons.coupons) { coupon in
                            CouponItemView(isForOrder: isForOrder, coupon: coupon)
                        }
                    }
                }
            }.navigationTitle(title)
            .listStyle(GroupedListStyle())
        }
    }
}

struct CouponsForOrder_Previews: PreviewProvider {
    static var previews: some View {
        CouponsListView(sections: mockSections, title: "Coupons", isForOrder: true)
    }
}
