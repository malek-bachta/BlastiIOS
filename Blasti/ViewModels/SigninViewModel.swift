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



    
}

