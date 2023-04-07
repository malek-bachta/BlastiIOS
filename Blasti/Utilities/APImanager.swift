//
//  APImanager.swift
//  Blasti
//
//  Created by MacOS on 6/4/2023.
//

import Alamofire

class NetworkService {
    
    func signUp(email: String, password: String, username: String, onSuccess: @escaping (_ title: String, _ message: String) -> Void, onFailure: @escaping (_ title: String, _ message: String) -> Void) {
        let signupURL = "https://serverblasti.onrender.com/api/user/register"
        AF.request(signupURL, method: .post, parameters: ["email": email, "password": password, "username": username], encoding: JSONEncoding.default)
            .validate(statusCode: 200..<401)
            .validate(contentType: ["application/json"])
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    guard let jsonData = data as? [String: Any],
                          let statusCode = response.response?.statusCode else {
                        onFailure("Error", "Invalid response format")
                        return
                    }
                    onSuccess("Welcome", "Thanks for joining our community. Please check the email sent to you to activate your account.")
                case .failure(let error):
                    print(error)
                    onFailure("Error", "Network request failed")
                }
            }
    }
    
    
    func signIn(email: String, password: String, onSuccess: @escaping (_ title: String, _ message: String) -> Void, onFailure: @escaping (_ title: String, _ message: String) -> Void) {
        let signinURL = "https://serverblasti.onrender.com/api/user/login"
        AF.request(signinURL, method: .post, parameters: ["email": email, "password": password], encoding: JSONEncoding.default)
            .validate(statusCode: 200..<401)
            .validate(contentType: ["application/json"])
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    guard let jsonData = data as? [String: Any],
                        let statusCode = response.response?.statusCode else {
                        onFailure("Error", "Invalid response format")
                        return
                    }
                       onSuccess("Success", "You are now signed in.")
                   case .failure(let error):
                       print(error)
                       onFailure("Error", "Network request failed")
                   }
               }
       }
}

