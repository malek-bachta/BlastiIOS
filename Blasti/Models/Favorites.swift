////
////  Favorites.swift
////  Blasti
////
////  Created by Apple Esprit on 11/5/2023.
////
//
//import Foundation
//
//class Favorites: ObservableObject {
//    private var movies: Set<String>
//    private let saveKey="Favorites"
//    
//    init()
////    {
//        movies =  []
//    }
//    func contains(_ movie: Movie) -> Bool {
//        movies.contains(movie.id)
//        
//    }
//    func add(_ movie: Movie) {
//        objectWillChange.send()
//        movies.insert(movie.id)
//        save()
//        
//    }
//    func remove(_ movie: Movie) {
//        objectWillChange.send()
//        movies.remove(movie.id)
//        save()
//    }
//    func save(){
//        
//    }
//    
//}
