//
//  AdminServiceImp.swift
//  Coupons
//
//  Created by Tal talspektor on 25/01/2021.
//

import Foundation

struct AdminServiceImp: AdminService {
    
    static let shared = AdminServiceImp()
    
    let client = AdminCilent()
    
    func login(email: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        client.router.request(.login(email, password)) { responseItem in
            ResponseHandler.handleWithDecoding(APIResponseItem<Bool>.self, responseItem) { (result) in
                completion(APIResponseHandler.handleResponse(result: result))
            }
        }
    }
    
    func getCustomers(completion: @escaping (Result<[Customer], Error>) -> Void) {
        client.router.request(.getCustomers) { responseItem in
            ResponseHandler.handleWithDecoding(APIResponseItem<[Customer]>.self ,responseItem) { (result) in
                completion(APIResponseHandler.handleResponse(result: result))
            }
        }
    }
    
    func getCompanies(completion: @escaping (Result<[Company], Error>) -> Void) {
        client.router.request(.getCompanies) { responseItem in
            ResponseHandler.handleWithDecoding(APIResponseItem<[Company]>.self ,responseItem) { (result) in
                completion(APIResponseHandler.handleResponse(result: result))
            }
        }
    }
    
    func addCompany(company: Company, completion: @escaping (Result<Company, Error>) -> Void) {
        client.router.request(.addComapny(company)) { responseItem in
            ResponseHandler.handleWithDecoding(APIResponseItem<Company>.self, responseItem) { (result) in
                completion(APIResponseHandler.handleResponse(result: result))
            }
        }
    }
    
    func updateCompany(company: Company, completion: @escaping (Result<Company, Error>) -> Void) {
        client.router.request(.updateCompany(company)) { responseItem in
            ResponseHandler.handleWithDecoding(APIResponseItem<Company>.self, responseItem) { (result) in
                completion(APIResponseHandler.handleResponse(result: result))
            }
        }
    }
    
    func deleteCompany(id: Int, completion: @escaping (Result<Company, Error>) -> Void) {
        client.router.request(.deleteCompany(id)) { responseItem in
            ResponseHandler.handleWithDecoding(APIResponseItem<Company>.self, responseItem) { (result) in
                completion(APIResponseHandler.handleResponse(result: result))
            }
        }
    }
    
    func getCompany(id: Int, completion: @escaping (Result<Company, Error>) -> Void) {
        client.router.request(.getCompany(id)) { responseItem in
            ResponseHandler.handleWithDecoding(APIResponseItem<Company>.self ,responseItem) { (result) in
                completion(APIResponseHandler.handleResponse(result: result))
            }
        }
    }
    
    func getCompany(name: String, completion: @escaping (Result<Company, Error>) -> Void) {
        client.router.request(.getCompanyByName(name)) { responseItem in
            ResponseHandler.handleWithDecoding(APIResponseItem<Company>.self ,responseItem) { (result) in
                completion(APIResponseHandler.handleResponse(result: result))
            }
        }
    }
    
    func addCustomer(customer: Customer, completion: @escaping (Result<Customer, Error>) -> Void) {
        client.router.request(.addCustomer(customer)) { responseItem in
            ResponseHandler.handleWithDecoding(APIResponseItem<Customer>.self, responseItem) { (result) in
                completion(APIResponseHandler.handleResponse(result: result))
            }
        }
    }
    
    func updateCustomer(customer: Customer, completion: @escaping (Result<Customer, Error>) -> Void) {
        client.router.request(.updateCustomer(customer)) { responseItem in
            ResponseHandler.handleWithDecoding(APIResponseItem<Customer>.self, responseItem) { (result) in
                completion(APIResponseHandler.handleResponse(result: result))
            }
        }
    }
    
    func deleteCustomer(id: Int, completion: @escaping (Result<Customer, Error>) -> Void) {
        client.router.request(.deleteCustomer(id)) { responseItem in
            ResponseHandler.handleWithDecoding(APIResponseItem<Customer>.self, responseItem) { (result) in
                completion(APIResponseHandler.handleResponse(result: result))
            }
        }
    }
    
    func getCustomer(id: Int, completion: @escaping (Result<Customer, Error>) -> Void) {
        client.router.request(.getCustomer(id)) { responseItem in
            ResponseHandler.handleWithDecoding(APIResponseItem<Customer>.self ,responseItem) { (result) in
                completion(APIResponseHandler.handleResponse(result: result))
            }
        }
    }
}
