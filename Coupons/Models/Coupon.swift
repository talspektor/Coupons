//
//  Coupon.swift
//  CouponSystem
//
//  Created by Tal talspektor on 14/01/2021.
//

import Foundation

struct Coupon: Codable, Equatable, Identifiable, Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    let id: Int
    let company: Company
    let category: Category
    let title: String
    let description: String
    let startDate: Date
    let endDate: Date
    let amount: Int
    let price: Double
    let imageUrl: String
}
