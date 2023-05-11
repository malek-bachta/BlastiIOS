//
//  Ticket.swift
//  Blasti
//
//  Created by fullme on 4/5/2023.
//

import Foundation
import UIKit
struct FavoriteM: Codable,Hashable {
    var idMovie: String
    var idUser: String
}

struct MessageResponse: Decodable {
    let message: String
}
