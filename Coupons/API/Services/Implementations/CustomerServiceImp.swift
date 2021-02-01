//
//  CustomerServiceImp.swift
//  Coupons
//
//  Created by Tal talspektor on 25/01/2021.
//

import Foundation

struct CustomerServiceImp: CustomerService {
    
    static let shared = CustomerServiceImp()
    
    var client = CustomerClient()
    
    func login(email: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        client.router.request(.login(email, password)) { data, response, error in
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
    
    func getAllCoupons(completion: @escaping (Result<[Coupon], Error>) -> Void) {
        client.router.request(.getCoupons) { (data, response, error) in
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
                        let apiResponse = try JSONDecoder().decode([Coupon].self, from: responseData)
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
    
    func getCustomerCoupons(completion: @escaping (Result<[Coupon], Error>) -> Void) {
        client.router.request(.getCustomerCoupons) { (data, response, error) in
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
                        let apiResponse = try JSONDecoder().decode([Coupon].self, from: responseData)
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
    
    func purchaseCoupon(id: Int, completion: @escaping (Result<Bool, Error>) -> Void) {
        client.router.request(.purchaseCoupon(id)) { (data, response, error) in
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
    
    func getCoupons(categoty: Category, completion: @escaping (Result<[Coupon], Error>) -> Void) {
        client.router.request(.getCouponsByCategury(categoty)) { (data, response, error) in
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
                        let apiResponse = try JSONDecoder().decode([Coupon].self, from: responseData)
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
    
    func getCoupons(maxPrice: Double, completion: @escaping (Result<[Coupon], Error>) -> Void) {
        client.router.request(.getCouponsPriceLessThen(maxPrice)) { (data, response, error) in
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
                        let apiResponse = try JSONDecoder().decode([Coupon].self, from: responseData)
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
    
    func getCustomer(completion: @escaping (Result<Customer, Error>) -> Void) {
        client.router.request(.getCustoemr) { (data, response, error) in
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
