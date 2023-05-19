//
//  User.swift
//  Blasti
//
//  Created by Siwar Nafti on 5/4/2023.
//

import Foundation

struct User: Codable{
     var id:String=""
    var username: String=""
    var email: String=""
    var password: String=""
    var role: String=""
    var avatar: String=""
    var bio: String=""
    var codeVerif: String=""
    var codeForget: String=""
    var verified: String=""
    
    
}


struct LogedInUser: Codable{
     var id:String=""
    var username: String=""
    var email: String=""
    var role: String=""
    var avatar: String=""
    var bio: String=""
    var token: String=""
  
    
    func getuser() -> LogedInUser? {
        let defaults = UserDefaults.standard
        
        if let savedUser = defaults.object(forKey: "user") as? Data {
            let decoder = JSONDecoder()
            
            if let loadedUser = try? decoder.decode(LogedInUser.self, from: savedUser) {
                return loadedUser
            }
        }
        
        return nil
    }
   
}

struct UserChangePassword:Codable{
    var oldPassword:String=""
    var newPassword:String=""
    var email: String = ""
    
}


struct UserForgotPassword:Codable{
    var codeForget:String
    var email:String
    var password:String
}
