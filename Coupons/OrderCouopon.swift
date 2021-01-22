//
//  OrderCouopon.swift
//  CouponSystem
//
//  Created by Tal talspektor on 16/01/2021.
//

import SwiftUI

class OrderCoupon: ObservableObject {
    @Published var coupons: [CategoryCoupons]?
    @Published var myCouopns: [CategoryCoupons]?
    @Published var orderList = [Coupon]()
    var order: Set<Coupon> = Set<Coupon>()
    
    var total: Double = 0
    
    func addToTotal(coupon: Coupon) {
        total += coupon.price
    }
    
    func addOrder(coupon: Coupon) {
        order.insert(coupon)
        if order.contains(coupon) {
            orderList.append(coupon)
        }
    }
    
    func add(coupon: Coupon) {
        var categoryCouopns = coupons?.first { $0.category == coupon.category }
        categoryCouopns?.coupons.append(coupon)
    }
    
    func addToMyCoupons(coupon: Coupon) {
        var categoryCouopns = myCouopns?.first { $0.category == coupon.category }
        categoryCouopns?.coupons.append(coupon)
    }
    //TODO: get coupons from REST API
    func fetchCoupons() {
        #if DEBUG
        coupons = mockSections
        #endif
    }
    //TODO: get coupons from REST API
    func fetchMyCoupons() {
        #if DEBUG
        myCouopns = mockSections
        #endif
        
    }
}
