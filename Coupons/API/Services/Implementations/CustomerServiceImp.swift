//
//  CustomerServiceImp.swift
//  Coupons
//
//  Created by Tal talspektor on 25/01/2021.
//

import Foundation

struct CustomerServiceImp: CustomerService {
    var client = CustomerClient()
    
    func getAllCoupons(completion: (Result<[Coupon]?, Error>) -> Void) {
        
    }
    
    func getCustomerCoupons(completion: (Result<[Coupon]?, Error>) -> Void) {
        
    }
    
    func getCoupon(id: Int, completion: (Result<Coupon?, Error>) -> Void) {
        
    }
    
    func purchaseCoupon(coupon: Coupon, completion: (Result<Bool, Error>) -> Void) {
        
    }
    
    func getCoupons(categoty: Category, completion: (Result<[Coupon]?, Error>) -> Void) {
        
    }
    
    func getCoupons(maxPrice: Double, completion: (Result<[Coupon]?, Error>) -> Void) {
        
    }
    
    func getCustomer(completion: (Result<Bool, Error>) -> Void) {
        
    }
    
    

}
