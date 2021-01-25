//
//  CompanyServiceImp.swift
//  Coupons
//
//  Created by Tal talspektor on 25/01/2021.
//

import Foundation

struct CompanyServiceImp: CompanyService {
    func addCoupon(coupon: Coupon, completion: (Result<Bool, Error>) -> Void) {
        
    }
    
    func updateCoupon(coupon: Coupon, completion: (Result<Bool, Error>) -> Void) {
        
    }
    
    func deleteCoupon(coupon: Coupon, completion: (Result<Bool, Error>) -> Void) {
        
    }
    
    func getCoupons(comletion: (Result<[Coupon]?, Error>) -> Void) {
        
    }
    
    func getCoupons(maxPrice: Double, completion: (Result<[Coupon]?, Error>) -> Void) {
        
    }
    
    func getCompany(completion: (Result<Company?, Error>) -> Void) {
        
    }
    
    var client = CompanyClient()
  
}
