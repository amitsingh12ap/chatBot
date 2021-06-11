//
//  ServiceManager.swift
//  AliveCor Coding Assignment
//
//  Created by 13216146 on 07/06/21.
//

import Foundation

final class ServiceManager: ServiceProtocol {
    static let shared = ServiceManager()
    private init() {}
    
    var baseUrl: String = {
        return "https://api.themoviedb.org/"
    }()
    var apiKey: String = {
        return "34c902e6393dc8d970be5340928602a7"
    }()
    
    func callApi(with endPoint: String, parameters:inout Parameters, headers: HTTPHeaders?, requestType: HttpMehtod, completion: @escaping NetworkRequestCompletion) {
        
        if  parameters["api_key"] == nil {
            parameters["api_key"] = self.apiKey
        }
        guard let url = URL(string: "\(baseUrl)\(endPoint)") else {
            return
        }
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10)
        do {
            try self.encode(urlRequest: &request, with: parameters)
            request.httpMethod = requestType.rawValue
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data,                            // is there data
                      let response = response as? HTTPURLResponse,  // is there HTTP response
                      (200 ..< 300) ~= response.statusCode,         // is statusCode 2XX
                      error == nil else {
                    completion(nil,nil,ApiError.invalidRequest) // was there no error, otherwise ...
                    return
                }
                completion(data,response,nil)
            }
            task.resume()
        } catch {
            completion(nil,nil,ApiError.invalidRequest)
        }
        
    }
    
    
    
}
