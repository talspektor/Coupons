//
//  ResponseItem.swift
//  Coupons
//
//  Created by Tal talspektor on 05/02/2021.
//

import Foundation

struct APIResponseItem<T: Decodable>: Decodable {
    let date: T?
    let message: String?
}
