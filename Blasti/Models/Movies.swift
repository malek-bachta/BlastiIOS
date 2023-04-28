//
//  Movies.swift
//  Blasti
//
//  Created by Siwar Nafti on 13/4/2023.
//

struct Movie: Codable,Hashable ,Identifiable{
    let _id: String

    let title: String
    let description: String
    let genre: String
    let image: String
    var id : String {_id}

   
    
   
}

