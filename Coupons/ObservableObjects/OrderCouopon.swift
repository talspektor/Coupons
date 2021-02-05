//
//  OrderCouopon.swift
//  CouponSystem
//
//  Created by Tal talspektor on 16/01/2021.
//

import SwiftUI
enum UserType: String {
    case admin = "Admin"
    case customer = "Customer"
    case company = "Conpany"
}
class CustomerObservable: ObservableObject {

    @Published var coupons: [CategoryCoupons]?
    @Published var myCouopns: [CategoryCoupons]?
    @Published var orderList = [Coupon]()
    @Published var useMockData: Bool = false
    @Published var isLoggedIn = false
    @Published var selectedType: UserType = UserType.company
    @Published var company: Company?
    @Published var customer: Customer?

    var order: Set<Coupon> = Set<Coupon>()
    
    var total: Double = 0
    
    init() {
//        fetchCoupons()
//        fetchMyCoupons()
    }
    
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
        var categoryCouopns = coupons?.first { $0.category.rawValue == coupon.categoryId }
        categoryCouopns?.coupons.append(coupon)
    }
    
    func addToMyCoupons(coupon: Coupon) {
        var categoryCouopns = myCouopns?.first { $0.category.rawValue == coupon.categoryId }
        categoryCouopns?.coupons.append(coupon)
    }
}
