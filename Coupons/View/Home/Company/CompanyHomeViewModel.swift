//
//  CompanyHomeViewNodel.swift
//  Coupons
//
//  Created by Tal talspektor on 01/02/2021.
//

import SwiftUI

extension ComapnyHameView {
    class CompanyHomeViewModel: ObservableObject {
        @Published private(set) var company: Company?
        @Published private(set) var categoryCoupons: [CategoryCoupons]?
        private var coupons: [Coupon] = []
        @Published private(set) var shouldShowAlert = false
        
        private let service = CompanyServiceImp.shared
        
        func dismissAlert() {
            shouldShowAlert = false
        }
        
        func getCompany() {
            service.getCompany { [weak self] (result) in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let company):
                        self?.company = company
                    case .failure:
                        self?.shouldShowAlert = true
                    }
                }
            }
        }
        
        func getCoupons() {
            service.getCoupons { [weak self] (result) in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let coupons):
                        self?.categoryCoupons = Utils.formatCouponsData(coupons: coupons)
                    case .failure:
                        self?.shouldShowAlert = true
                    }
                }
            }
        }
    }
}

