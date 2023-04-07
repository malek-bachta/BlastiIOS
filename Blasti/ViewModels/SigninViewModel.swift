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

