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
   
    
    init() {
        
        fetchFavMovies(id: mvm.getuser()!.id)
    }
    
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
        let url = baseUrl+"api/favorite/delete"
        
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
