//
//  CompanyServiceImp.swift
//  Coupons
//
//  Created by Tal talspektor on 25/01/2021.
//

import Foundation

struct CompanyServiceImp: CompanyService {
    
    static let shared = CompanyServiceImp()
    
    var client = CompanyClient()
    
    func login(email: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        client.router.request(.login(email, password)) { responseItem in
            ResponseHandler.handleWithDecoding(APIResponseItem<Bool>.self, responseItem) { (result) in
                completion(APIResponseHandler.handleResponse(result: result))
            }
        }
    }
    
    func addCoupon(coupon: Coupon, completion: @escaping (Result<Coupon, Error>) -> Void) {
        client.router.request(.addCoupon(coupon)) { responseItem in
            ResponseHandler.handleWithDecoding(APIResponseItem<Coupon>.self, responseItem) { (result) in
                completion(APIResponseHandler.handleResponse(result: result))
            }
        }
    }
    
    func updateCoupon(coupon: Coupon, completion: @escaping (Result<Coupon, Error>) -> Void) {
        client.router.request(.updateCoupon(coupon)) { responseItem in
            ResponseHandler.handleWithDecoding(APIResponseItem<Coupon>.self, responseItem) { (result) in
                completion(APIResponseHandler.handleResponse(result: result))
            }
        }
    }
    
    func deleteCoupon(id: Int, completion: @escaping (Result<Coupon, Error>) -> Void) {
        client.router.request(.deleteCoupon(id)) { responseItem in
            ResponseHandler.handleWithDecoding(APIResponseItem<Coupon>.self, responseItem) { (result) in
                completion(APIResponseHandler.handleResponse(result: result))
            }
        }
    }
    
    func getCoupons(completion: @escaping (Result<[Coupon], Error>) -> Void) {
        client.router.request(.getCoupons) { responseItem in
            ResponseHandler.handleWithDecoding(APIResponseItem<[Coupon]>.self, responseItem) { (result) in
                completion(APIResponseHandler.handleResponse(result: result))
            }
        }
    }
    
    func getCoupons(maxPrice: Double, completion: @escaping (Result<[Coupon], Error>) -> Void) {
        client.router.request(.getCouponsPriceLessThen(maxPrice)) { responseItem in
            ResponseHandler.handleWithDecoding(APIResponseItem<[Coupon]>.self, responseItem) { (result) in
                completion(APIResponseHandler.handleResponse(result: result))
            }
        }
    }
    
    func getCompany(completion: @escaping (Result<Company, Error>) -> Void) {
        client.router.request(.getCompany) { responseItem in
            ResponseHandler.handleWithDecoding(APIResponseItem<Company>.self, responseItem) { (result) in
                completion(APIResponseHandler.handleResponse(result: result))
            }
        }
    }
}
