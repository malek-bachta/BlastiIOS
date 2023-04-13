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
    @Published var CodeSent : Bool = false
    @Published var currentUser: User?
    
    @Published var rememberMe = false

    init(){
        if(log || UserDefaults.standard.bool(forKey: "RememberMe")){
            log=true
        }
    }
    
    func signIn(email: String, password: String) {
        networkService.signIn(email: email, password: password, onSuccess: { (title, message) in
            DispatchQueue.main.async {
                self.log = true
                if(self.rememberMe){
                    UserDefaults.standard.set(self.rememberMe, forKey: "RememberMe")
                }
                self.signinResult = .success((title, message))
                self.currentUser = User(id: "", username: "", email: email, password: password, role: "", avatar: "", bio: "", codeVerif: "", codeForget: "", verified: "")
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
               self.CodeSent = true
                       
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
    
    
   

    func isValidEmail(email: String) -> Bool {
        // Use regular expression to validate email address format
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    
}

