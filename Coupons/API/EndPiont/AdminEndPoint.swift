//
//  CouponsAPI.swift
//  Coupons
//
//  Created by Tal talspektor on 25/01/2021.
//

import Foundation

enum AdminEndPoint: EndPointType {
    
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
        return URL(string: "https://localhost:8080/api")!
    }
    var path: String {
        switch self {
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
            return "/updte-customer"
        case .deleteCompany(_):
            return "/delete-company"
        case .deleteCustomer(_):
            return "/delete-customer"
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
    
    var task: HTTPTask { .request }
    var headers: HTTPHeaders? {
        return ["": ""]
    }
    
    
}
