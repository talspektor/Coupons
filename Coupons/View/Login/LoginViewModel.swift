//
//  LoginViewModel.swift
//  Coupons
//
//  Created by Tal talspektor on 15/02/2021.
//

import Foundation

extension LoginView {

    class LoginViewModel: ObservableObject {

        func didTapSubmitButton(email: String, password: String, selectedType: UserType, completion: @escaping (Bool) -> Void) {
            //if success navigate to home screen
            guard !email.isEmpty && !password.isEmpty else {
                DispatchQueue.main.async {
                    completion(false)
                }
                return
            }
            //Call service loin
            Repository.shared.login(withEmail: email, andPassword: password, forUser: selectedType) { result in
                switch result {
                case .success(let isLoggedin):
                    DispatchQueue.main.async {
                        completion(isLoggedin)
                    }
                case .failure(let error):
                    //TODO: present alert
                    print(error)
                    DispatchQueue.main.async {
                        completion(false)
                    }
                }
            }
        }
    }
}
