//
//  AdminHomeViewModel.swift
//  Coupons
//
//  Created by Tal talspektor on 01/02/2021.
//

import SwiftUI

extension AdminHomeView {
    class AdminHomeViewModel: ObservableObject {
        
        @Published private(set) var companies: [Company]?
        @Published private(set) var customers: [Customer]?
        @Published private(set) var shouldShowAlert = false
        var useMockData = false
        
        private let service = AdminServiceImp.shared
        
        func getComapnies() {
            if useMockData {
                companies = [randomCompany, randomCompany, randomCompany, randomCompany, randomCompany, randomCompany, randomCompany, randomCompany, randomCompany]
            } else {
                service.getCompanies { [weak self] (result) in
                    DispatchQueue.main.async {
                        switch result {
                        case .success(let companies):
                            self?.companies = companies
                        case .failure:
                            self?.shouldShowAlert = true
                        }
                    }
                }
            }
            
        }
        
        func getCustomers() {
            if useMockData {
                customers = [randomCustomer, randomCustomer, randomCustomer, randomCustomer, randomCustomer, randomCustomer, randomCustomer]
            } else {
                service.getCustomers { [weak self] (result) in
                    DispatchQueue.main.async {
                        switch result {
                        case .success(let customers):
                            self?.customers = customers
                        case .failure:
                            self?.shouldShowAlert = true
                        }
                    }
                }
            }
            
        }
    }
}
