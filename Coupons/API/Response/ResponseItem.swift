//
//  ResponseItem.swift
//  Coupons
//
//  Created by Tal talspektor on 05/02/2021.
//

import Foundation

struct ResponseItem<T> {
    let data: T?
    let error: Error?
}
