//
//  AdminHomeViewModel.swift
//  Coupons
//
//  Created by Tal talspektor on 01/02/2021.
//

import SwiftUI
import Combine

extension AdminHomeView {
    class AdminHomeViewModel: ObservableObject {
        
        @Published private(set) var companies: [Company]?
        @Published private(set) var customers: [Customer]?
        @Published private(set) var shouldShowAlert = false
        @Published private(set) var errorMessage: String = ""
        var useMockData = false
        
        private let service = AdminServiceImp.shared
        
        func getComapnies(completion: @escaping (Bool) -> Void) {
            if useMockData {
                companies = [randomCompany, randomCompany, randomCompany, randomCompany, randomCompany, randomCompany, randomCompany, randomCompany, randomCompany]
            } else {
                service.getCompanies { [weak self] (result) in
                    DispatchQueue.main.async {
                        switch result {
                        case .success(let companies):
                            self?.companies = companies
                            completion(false)
                        case .failure(let error):
                            self?.errorMessage = error.localizedDescription
                            completion(true)
                        }
                    }
                }
            }
            
        }
        
        func getCustomers(completion: @escaping (Bool) -> Void) {
            if useMockData {
                customers = [randomCustomer, randomCustomer, randomCustomer, randomCustomer, randomCustomer, randomCustomer, randomCustomer]
            } else {
                service.getCustomers { [weak self] (result) in
                    DispatchQueue.main.async {
                        switch result {
                        case .success(let customer):
                            self?.customers = customer
                            completion(false)
                        case .failure(let error):
                            self?.errorMessage = error.localizedDescription
                            completion(true)
                        }
                    }
                }
            }
            
        }
    }
}
