//
//  ServiceConstant.swift
//  AliveCor Coding Assignment
//
//  Created by 13216146 on 07/06/21.
//

import Foundation

typealias Parameters = [String:String]
typealias HTTPHeaders = [String:String]
typealias NetworkRequestCompletion = (_ data: Data?,_ response: URLResponse?,_ error: ApiError?)->()

enum HttpMehtod: String {
    case get    = "GET"
    case post   = "POST"
    case put    = "PUT"
    case delete = "DELETE"
}

enum ApiError: String, Error {
    case invalidUrl     = "Please Enter a Valid Url"
    case invalidRequest = "OOPs...Looks like not a valid request"
    case encodingFailed = "Something went wrong with response. Please try again later."
}

enum EndPoint: String {
    case nowPlaying = "3/movie/now_playing"
    case posterBasePath = "https://image.tmdb.org/t/p/w500"
}
