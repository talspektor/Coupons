//
//  AdminServiceImp.swift
//  Coupons
//
//  Created by Tal talspektor on 25/01/2021.
//

import Foundation

struct AdminServiceImp: AdminService {
    
    let client = AdminCilent()
    
    func getCustomers(completion: @escaping (Result<[Customer], Error>) -> Void) {
        client.router.request(.getCustomers) { (data, response, error) in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            if let response = response as? HTTPURLResponse {
                let result = NetworkManager.shared.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(.failure(NetworkResponse.noData))
                        return
                    }
                    do {
                        let apiResponse = try JSONDecoder().decode([Customer].self, from: responseData)
                        completion(.success(apiResponse))
                    } catch {
                        completion(.failure(NetworkResponse.uableToDecode))
                    }
                case .failure(let nenworkFailureError):
                    completion(.failure(nenworkFailureError))
                }
            }
        }
    }
    
    func getCompanies(completion: @escaping (Result<[Company]?, Error>) -> Void) {
        client.router.request(.getCompanies) { (data, response, error) in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            if let response = response as? HTTPURLResponse {
                let result = NetworkManager.shared.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(.failure(NetworkResponse.noData))
                        return
                    }
                    do {
                        let apiResponse = try JSONDecoder().decode([Company].self, from: responseData)
                        completion(.success(apiResponse))
                    } catch {
                        completion(.failure(NetworkResponse.uableToDecode))
                    }
                case .failure(let nenworkFailureError):
                    completion(.failure(nenworkFailureError))
                }
            }
        }
    }
    
    func addCompany(company: Company, completion: @escaping (Result<Bool, Error>) -> Void) {
        client.router.request(.addComapny(company)) { (data, response, error) in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            if let response = response as? HTTPURLResponse {
                let result = NetworkManager.shared.handleNetworkResponse(response)
                switch result {
                case .success:
                    completion(.success(true))
                case .failure(let nenworkFailureError):
                    completion(.failure(nenworkFailureError))
                }
            }
        }
    }
    
    func updateCompany(company: Company, completion: @escaping (Result<Bool, Error>) -> Void) {
        client.router.request(.updateCompany(company)) { (data, response, error) in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            if let response = response as? HTTPURLResponse {
                let result = NetworkManager.shared.handleNetworkResponse(response)
                switch result {
                case .success:
                    completion(.success(true))
                case .failure(let nenworkFailureError):
                    completion(.failure(nenworkFailureError))
                }
            }
        }
    }
    
    func deleteCompany(id: Int, completion: @escaping (Result<Bool, Error>) -> Void) {
        client.router.request(.deleteCompany(id)) { (data, response, error) in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            if let response = response as? HTTPURLResponse {
                let result = NetworkManager.shared.handleNetworkResponse(response)
                switch result {
                case .success:
                    completion(.success(true))
                case .failure(let nenworkFailureError):
                    completion(.failure(nenworkFailureError))
                }
            }
        }
    }
    
    func getCompany(id: Int, completion: @escaping (Result<Company?, Error>) -> Void) {
        client.router.request(.getCompany(id)) { (data, response, error) in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            if let response = response as? HTTPURLResponse {
                let result = NetworkManager.shared.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(.failure(NetworkResponse.noData))
                        return
                    }
                    do {
                        let apiResponse = try JSONDecoder().decode(Company.self, from: responseData)
                        completion(.success(apiResponse))
                    } catch {
                        completion(.failure(NetworkResponse.uableToDecode))
                    }
                case .failure(let nenworkFailureError):
                    completion(.failure(nenworkFailureError))
                }
            }
        }
    }
    
    func getCompany(name: String, completion: @escaping (Result<Company?, Error>) -> Void) {
        client.router.request(.getCompanyByName(name)) { (data, response, error) in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            if let response = response as? HTTPURLResponse {
                let result = NetworkManager.shared.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(.failure(NetworkResponse.noData))
                        return
                    }
                    do {
                        let apiResponse = try JSONDecoder().decode(Company.self, from: responseData)
                        completion(.success(apiResponse))
                    } catch {
                        completion(.failure(NetworkResponse.uableToDecode))
                    }
                case .failure(let nenworkFailureError):
                    completion(.failure(nenworkFailureError))
                }
            }
        }
    }
    
    func addCustomer(customer: Customer, completion: @escaping (Result<Bool, Error>) -> Void) {
        client.router.request(.addCustomer(customer)) { (data, response, error) in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            if let response = response as? HTTPURLResponse {
                let result = NetworkManager.shared.handleNetworkResponse(response)
                switch result {
                case .success:
                    completion(.success(true))
                case .failure(let nenworkFailureError):
                    completion(.failure(nenworkFailureError))
                }
            }
        }
    }
    
    func updateCustomer(customer: Customer, completion: @escaping (Result<Bool, Error>) -> Void) {
        client.router.request(.updateCustomer(customer)) { (data, response, error) in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            if let response = response as? HTTPURLResponse {
                let result = NetworkManager.shared.handleNetworkResponse(response)
                switch result {
                case .success:
                    completion(.success(true))
                case .failure(let nenworkFailureError):
                    completion(.failure(nenworkFailureError))
                }
            }
        }
    }
    
    func deleteCustomer(id: Int, completion: @escaping (Result<Bool, Error>) -> Void) {
        client.router.request(.deleteCustomer(id)) { (data, response, error) in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            if let response = response as? HTTPURLResponse {
                let result = NetworkManager.shared.handleNetworkResponse(response)
                switch result {
                case .success:
                    completion(.success(true))
                case .failure(let nenworkFailureError):
                    completion(.failure(nenworkFailureError))
                }
            }
        }
    }
    
    func getCustomer(id: Int, completion: @escaping (Result<Customer, Error>) -> Void) {
        client.router.request(.getCustomer(id)) { (data, response, error) in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            if let response = response as? HTTPURLResponse {
                let result = NetworkManager.shared.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(.failure(NetworkResponse.noData))
                        return
                    }
                    do {
                        let apiResponse = try JSONDecoder().decode(Customer.self, from: responseData)
                        completion(.success(apiResponse))
                    } catch {
                        completion(.failure(NetworkResponse.uableToDecode))
                    }
                case .failure(let nenworkFailureError):
                    completion(.failure(nenworkFailureError))
                }
            }
        }
    }
    
    
    
    
}
