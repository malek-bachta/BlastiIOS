////
////  database.swift
////  Blasti
////
////  Created by Apple Esprit on 11/5/2023.
////
//
//import Foundation
//final class database {
//    private let FAV_KEY="fav_key"
//    
//    func save (movies: Set<String>){
//        let array = Array(movies)
//        UserDefaults.standard.set(array, forKey: FAV_KEY)
//    }
//    
//    func load (){
//        let array = UserDefaults.standard.array(forKey: FAV_KEY) as? [Int] ?? [Int]()
//        return Set(array)
//    }
//}
