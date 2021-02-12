//
//  CustomerServiceImp.swift
//  Coupons
//
//  Created by Tal talspektor on 25/01/2021.
//

import Foundation

struct CustomerServiceImp: CustomerService {
    
    static let shared = CustomerServiceImp()
    
    var client = CustomerClient()
    
    func login(email: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        client.router.request(.login(email, password)) { responseItem in
            ResponseHandler.handleWithDecoding(APIResponseItem<Bool>.self, responseItem) { (result) in
                completion(APIResponseHandler.handleResponse(result: result))
            }
        }
    }
    
    func getAllCoupons(completion: @escaping (Result<[Coupon], Error>) -> Void) {
        client.router.request(.getCoupons) { responseItem in
            ResponseHandler.handleWithDecoding(APIResponseItem<[Coupon]>.self, responseItem) { (result) in
                completion(APIResponseHandler.handleResponse(result: result))
            }
        }
    }
    
    func getCustomerCoupons(completion: @escaping (Result<[Coupon], Error>) -> Void) {
        client.router.request(.getCustomerCoupons) { responseItem in
            ResponseHandler.handleWithDecoding(APIResponseItem<[Coupon]>.self, responseItem) { (result) in
                completion(APIResponseHandler.handleResponse(result: result))
            }
        }
    }
    
    func purchaseCoupon(id: Int, completion: @escaping (Result<Coupon, Error>) -> Void) {
        client.router.request(.purchaseCoupon(id)) { responseItem in
            ResponseHandler.handleWithDecoding(APIResponseItem<Coupon>.self, responseItem) { (result) in
                completion(APIResponseHandler.handleResponse(result: result))
            }
        }
    }
    
    func getCoupons(categoty: Category, completion: @escaping (Result<[Coupon], Error>) -> Void) {
        client.router.request(.getCouponsByCategury(categoty)) { responseItem in
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
    
    func getCustomer(completion: @escaping (Result<Customer, Error>) -> Void) {
        client.router.request(.getCustoemr) { responseItem in
            ResponseHandler.handleWithDecoding(APIResponseItem<Customer>.self, responseItem) { (result) in
                completion(APIResponseHandler.handleResponse(result: result))
            }
        }
    }
}
