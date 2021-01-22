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
        #if DEBUG
        customers = mockCustomers
        #endif
    }
    //TODO: implement
    func fetchCompanies() {
        #if DEBUG
        companies = mockCompanies
        #endif
    }
}
