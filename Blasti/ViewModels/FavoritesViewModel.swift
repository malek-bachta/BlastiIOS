////
////  FavoritesViewModel.swift
////  Blasti
////
////  Created by Apple Esprit on 11/5/2023.
////
//
//import SwiftUI
//extension FavouritesView
//{
//    final class ViewModel:ObservableObject {
//        @Published var movies =  [Movie]()
//        @Published var showingFavs=false
//        @Published var savedMovie: Set<Int> = [1, 7]
//        var filteredMovies: [Movie] {
//            if showingFavs {
//                return movies.filter{ savedMovie.contains($0.id)}
//                
//            }else {
//                return movies
//            }
//        }
//        private var db = database()
//        
//        init() {
//            //            self.savedMovie=db.load()
//            self.movies = Movie.sampleMovies
//        }
//        
//        func sortFavs() {
//            withAnimation{
//                showingFavs.toggle()
//            }
//        }
//        func contains(_ movie: Movie) -> Bool {
//            savedMovie.contains(movie.id)
//        }
//        
//        func toggleFav(){
//            if contains(movie){
//                savedMovie.remove(movie.id)
//            } else {
//                savedMovie.insert(movie.id)
//            }
//            db.save(movies: savedMovie)
//        }
//        
//        
//        
//        
//        
//        
//        
//        
//        
//    }
//  
//}
//
