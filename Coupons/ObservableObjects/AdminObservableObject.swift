//
//  AdminAppData.swift
//  CouponSystem
//
//  Created by Tal talspektor on 18/01/2021.
//

import SwiftUI

class AdminObservableObject: ObservableObject {
    @Published var customers = [Customer]()
    @Published var companies = [Company]()
    //Test
    init() {
        fetchCompanies()
        fetchCustomers()
    }
    
    func add(company: Company) {
        companies.append(company)
    }
    
    func add(customer: Customer) {
        customers.append(customer)
    }
    
    func delete(company: Company) {
        if let index = companies.firstIndex(of: company) {
            companies.remove(at: index)
        }
    }
    
    func delete(customer: Customer) {
        if let index = customers.firstIndex(of: customer) {
            customers.remove(at: index)
        }
    }
    
    //TODO: implement
    func fetchCustomers() {
//        #if DEBUG
//        customers = mockCustomers
//        #endif
//        AdminServiceImp.shared.getCustomers { result in
//            switch result {
//            case .success(let customers):
//                self.customers = customers
//            case .failure(let error):
//                print(error)
//            }
//        }
    }
    //TODO: implement
    func fetchCompanies() {
        #if DEBUG
        companies = mockCompanies
        #endif
//        AdminServiceImp.shared.getCompanies { result in
//            switch result {
//            case .success(let companies):
//                self.companies = companies
//            case .failure(let error):
//                print(error)
//            }
//        }
        
        //Test
//        AdminServiceImp.shared.getCompany(id: 25) { result in
//            switch result {
//            case .success(let company):
//                print(company)
//            case .failure(let error):
//                print(error)
//            }
//        }
    }
    
    
}
