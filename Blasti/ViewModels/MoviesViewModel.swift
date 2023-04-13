//
//  MoviesViewModel.swift
//  Blasti
//
//  Created by Apple Esprit on 13/4/2023.
//

import Foundation
import Combine
import Alamofire


class MoviesViewModel: ObservableObject {
    @Published var AddMovieResult: Result<(title: String, message: String), NSError>?

    private let networkService = NetworkService()
    @Published var title = ""
    @Published var date = ""
    @Published var genre = ""
    @Published var duration = ""
    @Published var Production = ""
    @Published var description = ""
    @Published var language = ""

    @Published var image = ""
    

    @Published var madd : Bool = false
    
    
    func addMovie(title: String, date: String, genre: String, description: String, duration: String, Production: String, language:String, image: String) {
        networkService.AddMovie(title: title, date: date, genre: genre, description: description, duration: duration, Production: Production,language: language, image: image, onSuccess: { (title, message) in
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
}
