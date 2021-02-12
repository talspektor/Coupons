//
//  APIResponseHandler.swift
//  Coupons
//
//  Created by Tal talspektor on 06/02/2021.
//

import Foundation

struct APIResponseHandler {
    static func handleResponse<T>(result: Result<APIResponseItem<T>, Error>) -> Result<T, Error> {
        switch result {
        case .success(let response):
            guard let data = response.date else {
                return (.failure(APIResponseError.ErrorMessage(response.message!)))
            }
            return (.success(data))
        case .failure(let error):
            return (.failure(error))
        }
    }
}
