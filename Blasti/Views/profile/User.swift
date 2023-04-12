//
//  User.swift
//  Blasti
//
//  Created by Siwar Nafti on 5/4/2023.
//

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
    mutating func setusername(_ username:String){
        self.username=username
    }
    mutating func setemail(email:String){
        self.email=email
    }
}
struct LogedInUser: Codable{
    var id:String=""
   var username: String=""
   var email: String=""
   //var password: String=""
   var role: String=""
   var avatar: String=""
   var bio: String=""
   var codeVerif: String=""
   var codeForget: String=""
   var verified: String=""
    
}
struct SignInUser: Codable{
    var id:String=""
   var username: String=""
   var email: String=""
   //var password: String=""
   var role: String=""
   var avatar: String=""
   var bio: String=""
   var codeVerif: String=""
   var codeForget: String=""
   var verified: String=""
    
}
