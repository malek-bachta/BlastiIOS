//
//  User.swift
//  Blasti
//
//  Created by Siwar Nafti on 5/4/2023.
//

import Foundation
struct User {
    var id: Int
    var name: String
    var email: String
    var password: String // assuming the user has a password to log in
    var profilePicture: String // assuming the profile picture is stored as a string representing the image URL or file path
    var reservationCount: Int
    var rating: Double
    var aboutMe: String
}
