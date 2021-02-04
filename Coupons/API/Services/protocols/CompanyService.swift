//
//  CompanyService.swift
//  Coupons
//
//  Created by Tal talspektor on 25/01/2021.
//

import Foundation

protocol CompanyService: ClientService {
    var client: CompanyClient { get }
    func addCoupon(coupon: Coupon, completion: @escaping (Result<Bool, Error>) -> Void)
    func updateCoupon(coupon: Coupon, completion: @escaping (Result<Bool, Error>) -> Void)
    func deleteCoupon(id: Int, completion: @escaping (Result<Bool, Error>) -> Void)
    func getCoupons(completion: @escaping (Result<[Coupon], Error>) -> Void)
    func getCoupons(maxPrice: Double, completion: @escaping (Result<[Coupon], Error>) -> Void)
    func getCompany(completion: @escaping (Result<Company, Error>) -> Void)
}
