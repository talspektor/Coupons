//
//  CouponServise.swift
//  Coupons
//
//  Created by Tal talspektor on 25/01/2021.
//

import Foundation

protocol CustomerService: ClientService {
    var client: CustomerClient { get }
    func getAllCoupons(completion: @escaping (Result<[Coupon], Error>) -> Void)
    func getCustomerCoupons(completion: @escaping (Result<[Coupon], Error>) -> Void)
    func purchaseCoupon(id: Int, completion: @escaping (Result<Coupon, Error>) -> Void)
    func getCoupons(categoty: Category, completion: @escaping (Result<[Coupon], Error>) -> Void)
    func getCoupons(maxPrice: Double, completion: @escaping (Result<[Coupon], Error>) -> Void)
    func getCustomer(completion: @escaping (Result<Customer, Error>) -> Void)
}
