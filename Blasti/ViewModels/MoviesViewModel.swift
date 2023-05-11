//
//  MoviesViewModel.swift
//  Blasti
//
//  Created by Apple Esprit on 13/4/2023.
//

import Foundation
import Combine
import Alamofire
import UIKit
import SwiftUI


class MoviesViewModel: ObservableObject {
    @Published var AddMovieResult: Result<(title: String, message: String), NSError>?
    @Published var movies = [Movie]()
    
    private let networkService = NetworkService()
    private let pvm = ProfileViewModel()
    @Published var title = ""
    @Published var date = ""
    @Published var genre = ""
    @Published var duration = ""
    @Published var Production = ""
    @Published var description = ""
    @Published var language = ""
    @Published var adress = ""
    
    @Published var image: UIImage?
    
    //    var user:User?
    @Published var madd : Bool = false
    
    init(){
        self.getMovies()
        //        user=getuser()
        //        print(user)
    }
    func addMovie(title: String,
                  //                  date: String,
                  genre: String,
                  description: String,
                  adress: String,
                  //                  duration: String,
                  //                  Production: String,
                  //                  language:String,
                  image: UIImage?
    ) {
        networkService.AddMovie(title: title,
                                //                                date: date,
                                genre: genre,
                                description: description,
                                adress: adress,
                                //                                duration: duration,
                                //                                Production: Production,
                                //                                language: language,
                                image: image!,
                                onSuccess: { (title, message) in
            DispatchQueue.main.async {
                self.madd = true
                self.AddMovieResult = .success((title, message))
            }
        }, onFailure: { (title, message) in
            DispatchQueue.main.async {
                self.AddMovieResult = .failure(NSError(domain: title, code: 0, userInfo: [NSLocalizedDescriptionKey: message]))
            }
        })
    }
    
    
    
    func getMovies() {
        networkService.fetchMovies() { [weak self]  result in
            DispatchQueue.main.async {
                switch result {
                case .success(let movies):
                    self?.movies = movies
                    print(movies)
                    
                case .failure(let error):
                    
                    print("error loading movies: \(error)")
                    //self?.state = .error(error.localizedDescription)
                }
            }
        }
    }

    
    func addFavorite(idMovie: String, idUser: String) {
        networkService.addFavoriteMovie(idMovie: idMovie, idUser: idUser, onSuccess: {
            DispatchQueue.main.async {
                // handle success
            }
        }, onFailure: { (title, message) in
            DispatchQueue.main.async {
                // handle failure
            }
        })
    }


    
}
