//
//  APIError.swift
//  ItunesSearchApp
//
//  Created by Karin Prater on 25.07.22.
//

import Foundation
import SwiftUI

enum APIError: Error {
    
    case badURL
    case urlSession(URLError?)
    case badResponse(Int)
    case decoding(DecodingError?)
    case unknown
    case ivalidlogin
    case invalidCredentials
    
    var description: LocalizedStringKey {
        switch self {
            case .badURL:
                return "badURL"
            case .urlSession(let error):
                return "urlSession error: \(error.debugDescription)"
            case .badResponse(let statusCode):
                return "bad response with status code: \(statusCode)"
            case .decoding(let decodingError):
                return "decoding error"
            case .unknown:
                return "unknown error"
        case .ivalidlogin:
            return "login error"
        case .invalidCredentials:
            return "invalidCredentials error"
        }
    }
    
    var localizedDescription: String {
        switch self {
            case .badURL, .unknown:
               return "something went wrong"
            case .urlSession(let urlError):
                return urlError?.localizedDescription ?? "something went wrong"
            case .badResponse(_):
                return "something went wrong"
            case .decoding(let decodingError):
                return decodingError?.localizedDescription ?? "something went wrong"
        case .ivalidlogin:
            return "ThePasswordDoesNotMeetTheRequiredComplexityRules"
        case .invalidCredentials:
            return "invalidCredentials error"
      
        }
    }
}
