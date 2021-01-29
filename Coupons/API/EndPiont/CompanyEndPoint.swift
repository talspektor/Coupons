//
//  CompanyEndPoint.swift
//  Coupons
//
//  Created by Tal talspektor on 25/01/2021.
//

import Foundation

enum CompanyEndPoint: EndPointType {
    case login(String, String)
    case addCoupon(Coupon)
    case updateCoupon(Coupon)
    case deleteCoupon(Int)
    case getCoupons
    case getCouponsPriceLessThen(Double)
    case getCompany
    
    var baseURL: URL {
        return URL(string: "http://localhost:8080/api")!
    }
    
    var path: String {
        switch self {
        case .login(let email, let password):
            return "/compamy/login/\(email)/\(password)"
        case .addCoupon:
            return "/add-coupon"
        case .updateCoupon:
            return "/update-coupon"
        case .deleteCoupon(let id):
            return "/delete-coupon/\(id)"
        case .getCoupons:
            return "/company/coupons"
        case .getCouponsPriceLessThen(let maxPrice):
            return "/company/coupons/\(maxPrice)"
        case .getCompany:
            return "/company"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .addCoupon:
            return .post
        case .updateCoupon:
            return .put
        case .deleteCoupon:
            return .put
        case .getCoupons:
            return .get
        case .getCouponsPriceLessThen:
            return .get
        case .getCompany:
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
