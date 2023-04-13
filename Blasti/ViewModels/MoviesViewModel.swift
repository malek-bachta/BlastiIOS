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
    @Published var title = ""
    @Published var date = ""
    @Published var genre = ""
    @Published var duration = ""
    @Published var Production = ""
    @Published var description = ""
    @Published var language = ""

    @Published var image = ""
    

    @Published var madd : Bool = false
    
    
    func addMovie(title: String,
//                  date: String,
                  genre: String,
                  description: String
//                  duration: String,
//                  Production: String,
//                  language:String,
//                  image: UIImage
    ) {
        networkService.AddMovie(title: title,
//                                date: date,
                                genre: genre,
                                description: description,
//                                duration: duration,
//                                Production: Production,
//                                language: language,
//                                image: image,
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
        networkService.getMovies(onSuccess: { (moviesData) in
            DispatchQueue.main.async {
                self.movies = moviesData.map { movieData in
                    // Assuming the API returns keys like 'id', 'title', and 'imageURL'
                    let id = movieData["id"] as? Int ?? 0
                    let title = movieData["title"] as? String ?? ""
                    let imageURL = movieData["imageURL"] as? String ?? ""
                    print("Movies fetched: \(self.movies)") // Add this line

                    // Create a Movie object for each movieData
                    return Movie(id: id, title: title, imageURL: imageURL)
                }
            }
        }, onFailure: { title, message in
            DispatchQueue.main.async {
                // You can handle the error here or create a separate property for the error message and update it
                print("Error: \(title), Message: \(message)")
            }
        })
    }

    func movieInput(title: String, placeholder: String, text: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(title)
                .font(.headline)
                .foregroundColor(.yellow)
            
            TextField(placeholder, text: text)
                .padding()
                .background(Color.white.opacity(0.3))
                .cornerRadius(8)
                .foregroundColor(.white)
        }
        .padding(.horizontal)
    }
}
