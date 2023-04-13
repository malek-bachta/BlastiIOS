//
//  APImanager.swift
//  Blasti
//
//  Created by MacOS on 6/4/2023.
//

import Alamofire
import UIKit

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
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 
    
    func signIn(email: String, password: String, onSuccess: @escaping (_ title: String, _ message: String) -> Void, onFailure: @escaping (_ title: String, _ message: String) -> Void) {
        let signinURL = "https://serverblasti.onrender.com/api/user/login"
        AF.request(signinURL, method: .post, parameters: ["email": email, "password": password], encoding: JSONEncoding.default)
            .validate(statusCode: 200..<401)
            .validate(contentType: ["application/json", "text/html"]) // Update content types
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
                    print(response.result)
                    onFailure("Error", "Network request failed")
                }
        }
    }
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 
    
    
    func sendCodeForgot(email: String, onSuccess: @escaping (_ title: String, _ message: String) -> Void, onFailure: @escaping (_ title: String, _ message: String) -> Void) {
        let sendCodeForgotURL = "https://serverblasti.onrender.com/api/user/sendCodeForgot"
        AF.request(sendCodeForgotURL, method: .post, parameters: ["email": email], encoding: JSONEncoding.default)
            .validate(statusCode: 200..<401)
            .validate(contentType: ["application/json", "text/html"])
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    guard let jsonData = data as? [String: Any],
                        let statusCode = response.response?.statusCode else {
                            onFailure("Error", "Invalid response format")
                            return
                    }
                    onSuccess("Success", "Password reset code sent to your email.")
                case .failure(let error):
                    print(response.result)
                    onFailure("Error", "Network request failed")
                }
        }
    }
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 
    
    
    func verifyCodeForgot(email: String, codeForget: String, onSuccess: @escaping (_ title: String, _ message: String) -> Void, onFailure: @escaping (_ title: String, _ message: String) -> Void) {
            let verifyCodeForgotURL = "https://serverblasti.onrender.com/api/user/verifyCodeForgot"
            AF.request(verifyCodeForgotURL, method: .post, parameters: ["email": email, "codeForget": codeForget], encoding: JSONEncoding.default)
                .validate(statusCode: 200..<401)
                .validate(contentType: ["application/json", "text/html"])
                .responseJSON { response in
                    switch response.result {
                    case .success(let data):
                        guard let jsonData = data as? [String: Any],
                            let statusCode = response.response?.statusCode else {
                                onFailure("Error", "Invalid response format")
                                return
                        }
                        if let message = jsonData["message"] as? String {
                            onSuccess("Success", message)
                        } else {
                            onFailure("Error", "Failed to verify code")
                        }
                    case .failure(let error):
                        print(response.result)
                        onFailure("Error", "Network request failed")
                    }
            }
        }
 
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 
    
    func editProfile(email: String, password: String, username: String, onSuccess: @escaping (_ title: String, _ message: String) -> Void, onFailure: @escaping (_ title: String, _ message: String) -> Void) {
        let editProfileURL = "https://serverblasti.onrender.com/api/user/editProfile" // Update URL
        AF.request(editProfileURL, method: .post, parameters: ["email": email, "password": password, "username": username], encoding: JSONEncoding.default)
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
                    onSuccess("Success", "Profile updated successfully.")
                case .failure(let error):
                    print(error)
                    onFailure("Error", "Network request failed")
                }
            }
        }
    
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    func AddMovie(title: String,
                  genre: String,
                  description: String,
//                  image: UIImage,
                  onSuccess: @escaping (_ title: String, _ message: String) -> Void,
                  onFailure: @escaping (_ title: String, _ message: String) -> Void) {
        
        let AddMovieURL = "https://serverblasti.onrender.com/api/movies/add"
        
        let headers: HTTPHeaders = ["Content-type": "multipart/form-data"]
        
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(title.data(using: .utf8)!, withName: "title")
            multipartFormData.append(genre.data(using: .utf8)!, withName: "genre")
            multipartFormData.append(description.data(using: .utf8)!, withName: "description")
            
//            if let imageData = image.jpegData(compressionQuality: 0.5) {
//                multipartFormData.append(imageData, withName: "image", fileName: "image.jpeg", mimeType: "image/jpeg")
//            }
            
        }, to: AddMovieURL, usingThreshold: MultipartFormData.encodingMemoryThreshold, method: .post, headers: headers)
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
                onSuccess("congrats", "the movie is added succesfully.")
            case .failure(let error):
                print(error)
                onFailure("Error", "Network request failed")
            }
        }
    }
    
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
          ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      
      func getMovies(onSuccess: @escaping (_ movies: [[String: Any]]) -> Void, onFailure: @escaping (_ title: String, _ message: String) -> Void) {
          let getAllMoviesURL = "https://serverblasti.onrender.com/api/movies/all"
          
          AF.request(getAllMoviesURL)
              .validate(statusCode: 200..<401)
              .validate(contentType: ["application/json"])
              .responseJSON { response in
                  switch response.result {
                  case .success(let data):
                      guard let jsonData = data as? [[String: Any]] else {
                          onFailure("Error", "Invalid response format")
                          return
                      }
                      onSuccess(jsonData)
                  case .failure(let error):
                      print(error)
                      onFailure("Error", "Network request failed")
                  }
              }
      }
      
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
          ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    
    
    }




