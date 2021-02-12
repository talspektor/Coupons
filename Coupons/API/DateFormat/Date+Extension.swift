//
//  DateFormatter.swift
//  Coupons
//
//  Created by Tal talspektor on 03/02/2021.
//

import Foundation

enum DateType: String {
    case serverDate = "yyyy-MM-dd"
}

extension Date { 
    func format(to type: DateType) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = type.rawValue
        return formatter.string(from: self)
    }
}
