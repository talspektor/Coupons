//
//  CustomerHomeViewModel.swift
//  Coupons
//
//  Created by Tal talspektor on 01/02/2021.
//

import SwiftUI

extension CustomerHomeView {
    
    class CustomerHomeViewModel: ObservableObject {

        @Published private(set) var userCategoryCoupons: [CategoryCoupons]?
        @Published private(set) var allCategoryCoupons: [CategoryCoupons]?
        @Published private(set) var shouldShowAlert = false
        
        var useMockData: Bool = false

        private let service = CustomerServiceImp.shared
        
        func getCustomerCoupons() {
            if useMockData {
                userCategoryCoupons = mockSections
            } else {
                service.getCustomerCoupons { [weak self] (result) in
                    DispatchQueue.main.async {
                        switch result {
                        case .success(let coupons):
                        self?.userCategoryCoupons = Utils.formatCouponsData(coupons: coupons)
                        case .failure:
                            self?.shouldShowAlert = true
                        }
                    }
                }
            }
            
        }
        
        func getAllCoupons() {
            if useMockData {
                allCategoryCoupons = mockSections
            } else {
                service.getAllCoupons { [weak self] (result) in
                    switch result {
                    case .success(let coupons):
                        self?.allCategoryCoupons = Utils.formatCouponsData(coupons: coupons)
                    case .failure:
                        ()
                    }
                }
            }
        }
    }
}
