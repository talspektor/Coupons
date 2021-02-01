//
//  AddCouponViewModel.swift
//  Coupons
//
//  Created by Tal talspektor on 01/02/2021.
//

import SwiftUI

extension AddCouponView {
    class AddCouponViewModel: ObservableObject {
        @Published var coupon: Coupon = Coupon(id: 1, company: randomCompany, category: Category.ELECTRICITY, title: "", description: "", startDate: Date(), endDate: Date(), amount: 0, price: 0, imageUrl: "")
        @Published private(set) var sholdDismiss: Bool = false
        @Published private(set) var shouldShowAlert = false
        
        private var service = CompanyServiceImp.shared
        
        var title = "" {
            didSet {
                coupon.title = title
            }
        }
        
        var description = "" {
            didSet {
                coupon.description = description
            }
        }
        
        var amount = "" {
            didSet {
                coupon.amount = Int(amount) ?? 0
            }
        }
        
        var price = "" {
            didSet {
                coupon.price = Double(price) ?? 0.0
            }
        }
        
        func addCoupon(forCompany company: Company) {
            if !coupon.title.isEmpty && !coupon.description.isEmpty && !amount.isEmpty && !price.isEmpty {
                DispatchQueue.main.async { [weak self] in
                    guard let coupon = self?.coupon else { return }
                    self?.service.addCoupon(coupon: coupon) { (result) in
                        switch result {
                        case .success(let isAdded):
                            self?.sholdDismiss = isAdded
                        case .failure:
                            self?.shouldShowAlert = true
                        }
                    }
                }
            } else {
                shouldShowAlert = true
            }
        }
    }
}
