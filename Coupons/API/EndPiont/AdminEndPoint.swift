//
//  CouponsAPI.swift
//  Coupons
//
//  Created by Tal talspektor on 25/01/2021.
//

import Foundation

enum AdminEndPoint: EndPointType {
    
    case login(String, String)
    case getCompanies
    case getCustomers
    case addComapny(Company)
    case addCustomer(Customer)
    case updateCompany(Company)
    case updateCustomer(Customer)
    case deleteCompany(Int)
    case deleteCustomer(Int)
    case getCompany(Int)
    case getCompanyByName(String)
    case getCustomer(Int)
    
    var baseURL: URL {
        return URL(string: "http://localhost:8080/api")!
    }
    var path: String {
        switch self {
        case .login(let email, let password):
            return "/login/\(email)/\(password)"
        case .addComapny:
            return "/add-company"
        case .getCompanies:
            return "/companies"
        case .getCustomers:
            return "/customers"
        case .addCustomer(_):
            return "/add-customer"
        case .updateCompany(_):
            return "/update-company"
        case .updateCustomer(_):
            return "/update-customer"
        case .deleteCompany(let id):
            return "/delete-company/\(id)"
        case .deleteCustomer(let id):
            return "/delete-customer/\(id)"
        case .getCompany(let id):
            return "/company/\(id)"
        case .getCompanyByName(let name):
            return "/company/name/\(name)"
        case .getCustomer(let id):
            return "customer/\(id)"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .addComapny:
            return .post
        case .addCustomer:
            return .post
        case .deleteCompany:
            return .delete
        case .deleteCustomer:
            return .delete
        case .getCompanies:
            return .get
        case .getCustomers:
            return .get
        case .getCompany:
            return .get
        case .getCustomer:
            return .get
        case .getCompanyByName:
            return .get
        case .updateCompany:
            return .put
        case .updateCustomer:
            return .put
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .login:
            return .request
        case .addComapny(let company):
            let params: Parameters = [
                "name": company.name,
                "email": company.email,
                "password": company.password
            ]
            return .requestParametest(bodyParameters: params, urlParanatars: nil)
        case .addCustomer(let customer):
            let params: Parameters = [
                "firstName": customer.firstName,
                "lastName": customer.lastName,
                "email": customer.email,
                "password": customer.password
            ]
            return .requestParametest(bodyParameters: params, urlParanatars: nil)
        case .deleteCompany:
            return .request
        case .deleteCustomer:
            return .request
        case .getCompanies:
            return .request
        case .getCustomers:
            return .request
        case .getCompany:
            return .request
        case .getCustomer:
            return .request
        case .getCompanyByName:
            return .request
        case .updateCompany(let company):
            let params: Parameters = [
                "id": company.id,
                "name": company.name,
                "email": company.email,
                "password": company.password
            ]
            return .requestParametest(bodyParameters: params, urlParanatars: nil)
        case .updateCustomer(let customer):
            let params: Parameters = [
                "id": customer.id,
                "firstName": customer.firstName,
                "lastName": customer.lastName,
                "email": customer.email,
                "password": customer.password
            ]
             return .requestParametest(bodyParameters: params, urlParanatars: nil)
        }
        
    }
    var headers: HTTPHeaders? {
        return ["": ""]
    }
    
    
}
