//
//  HomeViewModel.swift
//  Coupons
//
//  Created by Tal talspektor on 16/02/2021.
//

import Foundation

//extension HomeView {
//    class HomeViewModel: ObservableObject {
//        @Published private(set) var companies: [Company]?
//        @Published private(set) var customers: [Customer]?
//        @Published private(set) var shouldShowAlert = false
//        @Published private(set) var errorMessage: String?
//
//        var useMockData = false
//
//        private let service = AdminServiceImp.shared
//
//        func getComapnies() {
//            if useMockData {
//                companies = [randomCompany, randomCompany, randomCompany, randomCompany, randomCompany, randomCompany, randomCompany, randomCompany, randomCompany]
//            } else {
//                service.getCompanies { [weak self] (result) in
//                    DispatchQueue.main.async {
//                        switch result {
//                        case .success(let companies):
//                            self?.companies = companies
//                        case .failure:
//                            self?.shouldShowAlert = true
//                        }
//                    }
//                }
//            }
//
//        }
//
//        func getCustomers() {
//            if useMockData {
//                customers = [randomCustomer, randomCustomer, randomCustomer, randomCustomer, randomCustomer, randomCustomer, randomCustomer]
//            } else {
//                service.getCustomers { [weak self] (result) in
//                    DispatchQueue.main.async {
//                        switch result {
//                        case .success(let customer):
//                            self?.customers = customer
//                        case .failure(let error):
//                            self?.shouldShowAlert = true
//                            self?.errorMessage = error.localizedDescription
//                        }
//                    }
//                }
//            }
//
//        }
//    }
//}
