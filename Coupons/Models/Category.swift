//
//  Category.swift
//  CouponSystem
//
//  Created by Tal talspektor on 14/01/2021.
//

import Foundation

enum Category: String, Codable, Hashable, Equatable {
    case FOOD
    case VACATION
    case SPORTS
    case ELECTRICITY

//    var description: String {
//        switch self {
//        case .FOOD:
//            return "FOOD"
//        case .VACATION:
//            return "VACATION"
//        case .SPORTS:
//            return "SPORTS"
//        case .ELECTRICITY:
//            return "ELECTRICITY"
//        }
//    }

    static func == (lhs: Category, rhs: Category) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
    
    static func > (lhs: Category, rhs: Category) -> Bool {
        return lhs.rawValue > rhs.rawValue
    }
}
