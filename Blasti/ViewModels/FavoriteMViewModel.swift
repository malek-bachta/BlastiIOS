//
//  FavoriteMViewModel.swift
//  Blasti
//
//  Created by fullme on 11/5/2023.
//

import Foundation
import Alamofire
class FavoriteMViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    var mvm = MoviesViewModel()
    @Published var verof:Bool=false
    
    
    init() {
        
        fetchFavMovies(id: mvm.getuser()!.id)
    }
    func verfi(request: FavoriteM)->Bool{
        print("malek ja lhna")
        verifFavorite(request: request) { result in
            switch result {
                
            case .success(let response):
                // Action si la connexion est réussie
                print(response)
                self.verof = true
                //   self.redirectToHomePage = true // Set redirectToHomePage to true
            case .failure(let error):
                // Action si la connexion échoue
                print(error)
            }
            print(request)
        }
        return verof
    }
    
    
//    func verif(idMovie:String , idUser:String){
//        verifFavorite(request: FavoriteM(idMovie: idMovie, idUser: idUser), onSuccess: { (title, message) in
//            DispatchQueue.main.async {
//                self.verof = true
//
//                }
//            }
//        }, onFailure: { (title, message) in
//            DispatchQueue.main.async {
//
//            }
//        })
//    }
//
    func fetchFavMovies(id:String) {
        
        
        AF.request(baseUrl+"api/favorite/FavoritefindByUser/"+id).responseDecodable(of: [Movie].self) { response in
            switch response.result {
            case .success(let movies):
                
                self.movies=movies
                print(movies)
            case .failure(let error):
                print(error.localizedDescription)
            
            }
        }
    }
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    
    func addFavoriteM(request: FavoriteM, completion: @escaping (Result<MessageResponse, Error>) -> ()) -> DataRequest {
        let url = baseUrl+"api/favoriteMovie/add"
        
        do {
            let encodedRequest = try JSONEncoder().encode(request)
            var urlRequest = try URLRequest(url: url, method: .post)
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = encodedRequest
            
            return AF.request(urlRequest)
                .validate(statusCode: 200..<500)
                .validate(contentType: ["application/json"])
                .responseData { response in
                    switch response.result {
                        case .success(let data):
                            do {
                                
                                let messageResponse = try JSONDecoder().decode(MessageResponse.self, from: data)
                                completion(.success(messageResponse))
                                print(messageResponse)
                               
                            } catch {
                                print(error)
                                completion(.failure(error))
                            }
                        case .failure(let error):
                            print(error)
                            completion(.failure(error))
                    }
                }
        } catch {
            print(error)
            completion(.failure(error))
        }
        return AF.request(url)
    }

    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    func verifFavorite(request: FavoriteM, completion: @escaping (Result<MessageResponse, Error>) -> ()) -> DataRequest {
        let url = baseUrl+"api/favoriteMovie/verif"
        
        do {
            let encodedRequest = try JSONEncoder().encode(request)
            var urlRequest = try URLRequest(url: url, method: .post)
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = encodedRequest
            
            return AF.request(urlRequest)
                .validate(statusCode: 200..<500)
                .validate(contentType: ["application/json"])
                .responseData { response in
                    switch response.result {
                        case .success(let data):
                            do {
                                
                                let messageResponse = try JSONDecoder().decode(MessageResponse.self, from: data)
                                completion(.success(messageResponse))
                                print(messageResponse)
                                
                            } catch {
                                print(error)
                                completion(.failure(error))
                            }
                        case .failure(let error):
                            print(error)
                            completion(.failure(error))
                    }
                }
        } catch {
            print(error)
            completion(.failure(error))
        }
        // default return statement
        return AF.request(url)
    }
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    
    func deleteFavorite(request: FavoriteM, completion: @escaping (Result<MessageResponse, Error>) -> ()) -> DataRequest {
        let url = baseUrl+"api/favoriteMovie/delete"
        
        do {
            let encodedRequest = try JSONEncoder().encode(request)
            var urlRequest = try URLRequest(url: url, method: .post)
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = encodedRequest
            
            return AF.request(urlRequest)
                .validate(statusCode: 200..<500)
                .validate(contentType: ["application/json"])
                .responseData { response in
                    switch response.result {
                        case .success(let data):
                            do {
                                
                                let messageResponse = try JSONDecoder().decode(MessageResponse.self, from: data)
                                completion(.success(messageResponse))
                                print(messageResponse)
                               
                            } catch {
                                print(error)
                                completion(.failure(error))
                            }
                        case .failure(let error):
                            print(error)
                            completion(.failure(error))
                    }
                }
        } catch {
            print(error)
            completion(.failure(error))
        }
        // default return statement
        return AF.request(url)
    }

    
}
