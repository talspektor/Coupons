//
//  Customer.swift
//  CouponSystem
//
//  Created by Tal talspektor on 14/01/2021.
//

import Foundation

struct Customer: Codable, Identifiable, Equatable {
    let id: Int
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
