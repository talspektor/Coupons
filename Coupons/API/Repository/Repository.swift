//
//  Repository.swift
//  Coupons
//
//  Created by Tal talspektor on 28/01/2021.
//

import SwiftUI

struct Repository {
    
    static let shared = Repository()
    
    func login(withEmail email: String, andPassword password: String, forUser user: UserType, completion: @escaping (Result<Bool, Error>) -> Void) {
        switch user {
        case .admin:
            AdminServiceImp.shared.login(email: email, password: password) { result in
                completion(result)
            }
        case .company:
            CompanyServiceImp.shared.login(email: email, password: password) { result in
                completion(result)
            }
        case .customer:
            CustomerServiceImp.shared.login(email: email, password: password) { result in
                completion(result)
            }
        }
    }
}
