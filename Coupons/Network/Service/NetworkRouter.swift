//
//  NetworkRouter.swift
//  Coupons
//
//  Created by Tal talspektor on 25/01/2021.
//

import Foundation
typealias NetworkRouterCompletion = (_ data: Data?, _ responce: URLResponse?, _ error: Error?) -> Void
protocol NetworkRouter: class {
    associatedtype EndPoint: EndPointType
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion)
    func cansel()
}
