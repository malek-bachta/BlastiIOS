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
  
}

