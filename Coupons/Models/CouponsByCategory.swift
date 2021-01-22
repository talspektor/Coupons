//
//  CouponsByCategory.swift
//  CouponSystem
//
//  Created by Tal talspektor on 21/01/2021.
//

import Foundation

struct CategoryCoupons: Codable, Identifiable, Equatable {
    static func == (lhs: CategoryCoupons, rhs: CategoryCoupons) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id: Int
    let category: Category
    var coupons: [Coupon]
}
