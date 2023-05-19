//
//  SigninViewModel.swift
//  Blasti
//
//  Created by MacOS on 6/4/2023.
//

import Foundation
import Combine
import Alamofire
import SwiftUI

class SigninViewModel: ObservableObject {
    @Published var signinResult: Result<(title: String, message: String), NSError>?
    private let networkService = NetworkService()
    @Published var email = ""
    @Published var password = ""
    @Published var log : Bool = false
    @Published var CodeSent : Bool = false
    @Published var currentUser: User?
    @Published var verificationcode:String=""
    @Published var invalid: Bool = false
    @Published var isSent: Bool = false
    @Published var EmailError:LocalizedStringKey?=""
    @Published var message:LocalizedStringKey=""
    @Published var verificationcodeError:LocalizedStringKey?
    @Published var passwordError:LocalizedStringKey?
    @Published var confirmPassword:String=""
    @Published var confirmPasswordError:LocalizedStringKey?


    
    var user:LogedInUser?

    @Published var rememberMe = false

    init(){
        if(log || UserDefaults.standard.bool(forKey: "RememberMe")){
            log=true
        }
        print("here")
        user=getuser()
        print(user)
    }
    
    func signIn(email: String, password: String) {
        networkService.signIn(email: email, password: password, onSuccess: { (user) in
            
            DispatchQueue.main.async {
                self.log = true
                if(self.rememberMe){
                    print("userlogedin")
                    print(user)
                    
                    self.saveuser(user: user)
                    UserDefaults.standard.set(self.rememberMe, forKey: "RememberMe")
                    UserDefaults.standard.set(user.id, forKey: "id")
                    
                }
                self.currentUser = User(id: "", username: "", email: email, password: password, role: "", avatar: "", bio: "", codeVerif: "", codeForget: "", verified: "")
            }
        }, onFailure: { (title, message) in
            DispatchQueue.main.async {
                self.signinResult = .failure(NSError(domain: title, code: 0, userInfo: [NSLocalizedDescriptionKey: message]))
            }
        })
    }

   
   
    func forgotpwd() {
        if(self.email.isEmpty){
            self.message = LocalizedStringKey("EmailIsRequired")
            self.invalid=true
        }else if(!(self.email.isValidEmail)){
            self.message = LocalizedStringKey("EmailIsInvalid")
            self.invalid=true
        }
        else
        {
            
            forgetPasswordApi(email:email){ result in
                
                switch result{
                case .success(_):
                    print(result)
                    //self.saveuser(user:self.user)
                    DispatchQueue.main.async {
                        self.isSent = true
                        print(self.isSent)

                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.invalid=true
                        self.message = error.description
                        print(error.localizedDescription)
                    }
                    
                }
                print(result)
            }
            self.message = LocalizedStringKey("CheckYourEmail")
            self.invalid=true
        }

    }
    
    
    func forgetPasswordApi(email:String, completion: @escaping (Result<String, APIError>) -> Void) {
           
           guard let url = URL(string: baseUrl+"api/user/SendCodeForgot") else {
               completion(.failure(.badURL))
               return
           }
        
           
        let body = ForgotRequest(email: self.email)
           var request = URLRequest(url: url)
           request.httpMethod = "POST"
           request.addValue("application/json", forHTTPHeaderField: "Content-Type")
           request.httpBody = try? JSONEncoder().encode(body)
           
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse else {
                    return
                }
            switch httpResponse.statusCode {
            case 200...299:
                if(error != nil) {
                    return
                }
                do {
                    if let data=data {
                        //let result = try JSONDecoder().decode(VerificationCodeResponse.self, from: data)
                        
                        completion(.success("verification sent"))}
                    else{
                        print("no data")
                    }
                }catch let jsonerror {
                    print(jsonerror)
                }
                
            case 422:
                completion(.failure(.ivalidlogin))
            case 403...499:
                completion(.failure(.ivalidlogin))
                // Handle client error
            case 500...599:
                completion(.failure(.unknown))
                // Handle server error
            default:
                completion(.failure(.invalidCredentials))
            }
        }.resume()
           
       }
  
    
    func confirmForgetPasswordApi(codeForget:String,email:String,password:String, completion: @escaping (Result<String, APIError>) -> Void) {
           
           guard let url = URL(string: baseUrl+"api/user/ChangePasswordForgot") else {
               completion(.failure(.badURL))
               return
           }
        
           
        let body = UserForgotPassword(codeForget:self.verificationcode,email: self.email,password: self.password)
           var request = URLRequest(url: url)
           request.httpMethod = "POST"
           request.addValue("application/json", forHTTPHeaderField: "Content-Type")
           request.httpBody = try? JSONEncoder().encode(body)
           
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse else {
                    return
                }
            switch httpResponse.statusCode {
            case 200...299:
                completion(.success("verification sent"))
            case 422:
                completion(.failure(.ivalidlogin))
            case 403...499:
                completion(.failure(.ivalidlogin))
                // Handle client error
            case 500...599:
                completion(.failure(.unknown))
                // Handle server error
            default:
                completion(.failure(.invalidCredentials))
            }
        }.resume()
           
       }
    
    
    func confirmForgotPwd() {
        print(email)
        confirmForgetPasswordApi(codeForget:verificationcode,email:email,password:password){ result in
                
                switch result{
                case .success(_):
                    print(result)
                    //self.saveuser(user:self.user)
                    DispatchQueue.main.async {
                        self.CodeSent = true

                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.invalid=true
                        self.message = error.description
                        print(error.localizedDescription)
                    }
                    
                }
                print(result)
            }
            self.message = LocalizedStringKey("PasswordChanged")
            self.invalid=true
        

    }
   

    func isValidEmail(email: String) -> Bool {
        // Use regular expression to validate email address format
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    
    func getuser()->LogedInUser?{
        let defaults = UserDefaults.standard
        if let saveduser = defaults.object(forKey: "user") as? Data{
            let decoder = JSONDecoder()
            if let loadeduser = try? decoder.decode(LogedInUser.self, from: saveduser){
                return loadeduser
            }
        }
        return nil
    }
    
    func saveuser(user:LogedInUser){
        let defaults = UserDefaults.standard
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(user) {
            defaults.set(encoded, forKey: "user")
        }
    }

    var isFormValid: Bool {
        return  EmailError == nil && passwordError == nil
    }
    func validatePassword() {
        if password.isEmpty {
            passwordError = LocalizedStringKey("PasswordIsRequired")
        } else if password.count < 8 {
            
            passwordError = LocalizedStringKey("PasswordMustBeAtLeast8characters")
        } else {
            passwordError = nil
        }
    }
    func validateverificationcode() {
        if verificationcode.isEmpty {
            verificationcodeError = LocalizedStringKey("VerificationCodeIsRequired")
        } else {
            verificationcodeError = nil
        }
    }
    func validateConfirmPassword() {
        if confirmPassword.isEmpty {
            confirmPasswordError = LocalizedStringKey("PasswordIsRequired")
        } else if password != confirmPassword {
            confirmPasswordError = LocalizedStringKey("PasswordsMustMatch")
        } else {
            confirmPasswordError = nil
        }
    }
    func logPressed() {
        print("Button pressed.")
    }
   
    

    
}

