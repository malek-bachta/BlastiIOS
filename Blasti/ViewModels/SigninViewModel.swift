//
//  SigninViewModel.swift
//  Blasti
//
//  Created by MacOS on 6/4/2023.
//

import Foundation
import Combine
import Alamofire

class SigninViewModel: ObservableObject {
    @Published var signinResult: Result<(title: String, message: String), NSError>?
    private let networkService = NetworkService()
    @Published var email = ""
    @Published var password = ""
    @Published var log : Bool = false
    
    func signIn(email: String, password: String) {
            networkService.signIn(email: email, password: password, onSuccess: { (title, message) in
                DispatchQueue.main.async {
                    self.log = true
                    self.signinResult = .success((title, message))
                    
                }
            }, onFailure: { (title, message) in
                DispatchQueue.main.async {
                    self.signinResult = .failure(NSError(domain: title, code: 0, userInfo: [NSLocalizedDescriptionKey: message]))
                }
            })
        }
    
    func sendCodeForgot(email: String) {
           networkService.sendCodeForgot(email: email, onSuccess: { (title, message) in
               // Handle success
               print(title, message+"email sent succes")
               
                       
           }) { (title, message) in
               // Handle failure
               print(title, message+"error")
           }
       }
    
    func verifyCodeForgot(email: String, codeForget: String) {
            networkService.verifyCodeForgot(email: email, codeForget: codeForget, onSuccess: { (title, message) in
                // Handle success
                print(title, message+"code verified successfully")
                
            }) { (title, message) in
                // Handle failure
                print(title, message+"error")
            }
        }
    
    
}

