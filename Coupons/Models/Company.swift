//
//  Company.swift
//  CouponSystem
//
//  Created by Tal talspektor on 14/01/2021.
//

import Foundation

struct Company: Codable, Identifiable, Equatable {
    static func == (lhs: Company, rhs: Company) -> Bool {
        return lhs.id == rhs.id
    }
    let id: Int
    let name: String
    let email: String
    let password: String
    let coupons: [Coupon]
}

#if DEBUG
let mockCompany = Company(id: 1, name: "conp", email: "comp@mail.com", password: "pass123", coupons: [Coupon]())
#endif
