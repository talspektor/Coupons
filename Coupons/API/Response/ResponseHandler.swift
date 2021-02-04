//
//  ResponseHandler.swift
//  Coupons
//
//  Created by Tal talspektor on 03/02/2021.
//

import Foundation

struct ResponseHandler {
    static func handle(_ responseItem: NetworkResponseItem, completion: (Result<Bool, Error>) -> Void) {
        guard responseItem.error == nil else {
            completion(.failure(responseItem.error!))
            return
        }
        guard let response = responseItem.response as? HTTPURLResponse else {
            completion(.failure(responseItem.error!))
            return
        }
        
        let result = NetworkManager.shared.handleNetworkResponse(response)
        switch result {
        case .success:
            completion(.success(true))
        case .failure(let nenworkFailureError):
            completion(.failure(nenworkFailureError))
        }
    }
    
    static func handleWithDecoding<T: Decodable>(_ type: T.Type, _ responseItem: NetworkResponseItem, completion: (Result<T, Error>) -> Void) {
        guard responseItem.error == nil else {
            completion(.failure(responseItem.error!))
            return
        }
        guard let response = responseItem.response as? HTTPURLResponse else {
            completion(.failure(responseItem.error!))
            return
        }
        
        let result = NetworkManager.shared.handleNetworkResponse(response)
        switch result {
        case .success:
            guard let responseData = responseItem.data else {
                completion(.failure(NetworkResponse.noData))
                return
            }
            do {
                let apiResponse = try JSONDecoder().decode(with: T.self, from: responseData)
                completion(.success(apiResponse))
                print("\nResponse JSON: \(apiResponse)\n")
            } catch {
                print(error)
                completion(.failure(error))
            }
        case .failure(let error):
            completion(.failure(error))
        }
    }
}
