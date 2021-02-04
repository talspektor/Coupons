//
//  String+Extension.swift
//  Coupons
//
//  Created by Tal talspektor on 04/02/2021.
//

import Foundation
extension String {
    func toDate(_ type: DateType) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = type.rawValue
        return dateFormatter.date(from: self)
    }
}
