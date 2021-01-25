//
//  EndPoint.swift
//  Coupons
//
//  Created by Tal talspektor on 25/01/2021.
//

import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
//    var bodyParameters: Parameters? { get }
    var headers: HTTPHeaders? { get }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

typealias HTTPHeaders = [String: String]
typealias Parameters = [String: Any]

enum HTTPTask {
    case request
    
    case requestParametest(bodyParameters: Parameters?, urlParanatars: Parameters?)
    
    case requestParametersAnyHeaders(bodyParameters: Parameters?, urlParanatars: Parameters?, additionalHeaders: HTTPHeaders?)
}
