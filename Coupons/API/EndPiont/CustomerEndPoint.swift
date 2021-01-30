//
//  CustomerEndPoint.swift
//  Coupons
//
//  Created by Tal talspektor on 25/01/2021.
//

import Foundation

enum CustomerEndPoint: EndPointType {
    
    case login(String, String)
    case purchaseCoupon(Int)
    case getCustomerCoupons
    case getCoupons
    case getCouponsByCategury(Category)
    case getCouponsPriceLessThen(Double)
    case getCustoemr
    
    var baseURL: URL {
        return URL(string: "http://localhost:8080/api")!
    }
    
    var path: String {
        switch self {
        case .login(let email, let password):
            return "/customer/login/\(email)/\(password)"
        case .purchaseCoupon(let id):
            return "/purchase-coupon/\(id)"
        case .getCustomerCoupons:
            return "/customer/coupons"
        case .getCoupons:
            return "/coupons"
        case .getCouponsByCategury(let category):
            return "/customer/coupons/\(category)"
        case .getCouponsPriceLessThen(let maxPrice):
            return "/customer/coupons/\(maxPrice)"
        case .getCustoemr:
            return "/customer"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .purchaseCoupon:
            return .put
        case .getCustomerCoupons:
            return .get
        case .getCoupons:
            return .get
        case .getCouponsByCategury:
            return .get
        case .getCouponsPriceLessThen:
            return .get
        case .getCustoemr:
            return .get
        }
    }
    
    var task: HTTPTask {
        return .request
    }
    
    var headers: HTTPHeaders? {
        ["": ""]
    }
    
    
}
