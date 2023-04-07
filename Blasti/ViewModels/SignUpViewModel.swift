//
//  SignUpViewModel.swift
//  Blasti
//
//  Created by MacOS on 6/4/2023.
//

import Foundation
import Combine
import Alamofire

class SignupViewModel: ObservableObject {
    @Published var signupResult: Result<(title: String, message: String), NSError>?
    @Published var signinResult: Result<(title: String, message: String), NSError>?
    private let networkService = NetworkService()
    @Published var email = ""
    @Published var password = ""
    @Published var verifPassword = ""
    @Published var username = ""

    func signUp(email: String, password: String, username: String) {
        networkService.signUp(email: email, password: password, username: username, onSuccess: { (title, message) in
            DispatchQueue.main.async {
                self.signupResult = .success((title, message))
            }
        }, onFailure: { (title, message) in
            DispatchQueue.main.async {
                self.signupResult = .failure(NSError(domain: title, code: 0, userInfo: [NSLocalizedDescriptionKey: message]))
            }
        })
    }
    
    func signIn(email: String, password: String) {
            networkService.signIn(email: email, password: password, onSuccess: { (title, message) in
                DispatchQueue.main.async {
                    self.signinResult = .success((title, message))
                }
            }, onFailure: { (title, message) in
                DispatchQueue.main.async {
                    self.signinResult = .failure(NSError(domain: title, code: 0, userInfo: [NSLocalizedDescriptionKey: message]))
                }
            })
        }
    
    
}

