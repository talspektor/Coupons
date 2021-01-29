//
//  AdminService.swift
//  Coupons
//
//  Created by Tal talspektor on 25/01/2021.
//

import Foundation

protocol AdminService: ClientService {
    var client: AdminCilent { get }
    func getCustomers(completion: @escaping (Result<[Customer], Error>) -> Void)
    func getCompanies(completion: @escaping (Result<[Company], Error>) -> Void)
    func addCompany(company: Company, completion: @escaping (Result<Bool, Error>) -> Void)
    func updateCompany(company: Company, completion: @escaping (Result<Bool, Error>) -> Void)
    func deleteCompany(id: Int, completion: @escaping (Result<Bool, Error>) -> Void)
    func getCompany(id: Int, completion: @escaping (Result<Company, Error>) -> Void)
    func getCompany(name: String, completion: @escaping (Result<Company, Error>) -> Void)
    func addCustomer(customer: Customer, completion: @escaping (Result<Bool, Error>) -> Void)
    func updateCustomer(customer: Customer, completion: @escaping (Result<Bool, Error>) -> Void)
    func deleteCustomer(id: Int, completion: @escaping (Result<Bool, Error>) -> Void)
    func getCustomer(id: Int,completion: @escaping (Result<Customer, Error>) -> Void)
}
