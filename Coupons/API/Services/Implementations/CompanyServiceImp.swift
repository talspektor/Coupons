//
//  CompanyServiceImp.swift
//  Coupons
//
//  Created by Tal talspektor on 25/01/2021.
//

import Foundation

struct CompanyServiceImp: CompanyService {
    
    static let shared = CompanyServiceImp()
    
    var client = CompanyClient()
    
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
    
    func addCoupon(coupon: Coupon, completion: @escaping (Result<Bool, Error>) -> Void) {
        client.router.request(.addCoupon(coupon)) { (data, response, error) in
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
    
    func updateCoupon(coupon: Coupon, completion: @escaping (Result<Bool, Error>) -> Void) {
        client.router.request(.updateCoupon(coupon)) { (data, response, error) in
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
    
    func deleteCoupon(id: Int, completion: @escaping (Result<Bool, Error>) -> Void) {
        client.router.request(.deleteCoupon(id)) { (data, response, error) in
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
    
    func getCoupons(completion: @escaping (Result<[Coupon]?, Error>) -> Void) {
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
    
    func getCoupons(maxPrice: Double, completion: @escaping (Result<[Coupon]?, Error>) -> Void) {
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
    
    func getCompany(completion: @escaping (Result<Company?, Error>) -> Void) {
        client.router.request(.getCompany) { (data, response, error) in
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
}
