//
//  ClientService.swift
//  Coupons
//
//  Created by Tal talspektor on 28/01/2021.
//

import Foundation

protocol ClientService {
    func login(email: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void)
}
