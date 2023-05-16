//
//  APImanager.swift
//  Blasti
//
//  Created by MacOS on 6/4/2023.
//

import Alamofire
import UIKit

class NetworkService {
    
    func signUp(email: String, password: String, username: String, onSuccess: @escaping (_ title: String, _ message: String) -> Void, onFailure: @escaping (_ title: String, _ message: String) -> Void) {
        let signupURL = baseUrl+"api/user/register"
        AF.request(signupURL, method: .post, parameters: ["email": email, "password": password, "username": username], encoding: JSONEncoding.default)
            .validate(statusCode: 200..<401)
            .validate(contentType: ["application/json"])
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    guard let jsonData = data as? [String: Any],
                          let statusCode = response.response?.statusCode else {
                        onFailure("Error", "Invalid response format")
                        return
                    }
                    onSuccess("Welcome", "Thanks for joining our community. Please check the email sent to you to activate your account.")
                case .failure(let error):
                    print(error)
                    onFailure("Error", "Network request failed")
                }
            }
    }
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
  
    func signIn(email: String, password: String, onSuccess: @escaping (_ user : LogedInUser) -> Void, onFailure: @escaping (_ title: String, _ message: String) -> Void) {
        let signinURL = baseUrl+"api/user/login"
        AF.request(signinURL, method: .post, parameters: ["email": email, "password": password], encoding: JSONEncoding.default)
            .validate(statusCode: 200..<401)
            .validate(contentType: ["application/json", "text/html"])
            .responseJSON { response in
                print("Response: \(response)")
                
                switch response.result {
                case .success(let data):
                    print("Data: \(data)")
                    
                    if let jsonData = data as? [String: Any] {
                        do {
                            let jsonData = try JSONSerialization.data(withJSONObject: jsonData, options: [])
                            let result = try JSONDecoder().decode(LogedInUser.self, from: jsonData)
                            
                            let defaults = UserDefaults.standard
                            let encoder = JSONEncoder()
                            if let encoded = try? encoder.encode(result) {
                                defaults.set(encoded, forKey: "user")
                                print("User saved: \(result)")
                                onSuccess(result)
                            }
                        } catch {
                            print("Error during JSON decoding: \(error)")
                            onFailure("Error", "Invalid response format")
                        }
                    } else {
                        print("Data is not a JSON dictionary")
                        onFailure("Error", "Invalid response format")
                    }
                case .failure(let error):
                    print("Error: \(error)")
                    print("Response result: \(response.result)")
                    onFailure("Error", "Network request failed")
                }
            }
    }
    
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    
    func sendCodeForgot(email: String, onSuccess: @escaping (_ title: String, _ message: String) -> Void, onFailure: @escaping (_ title: String, _ message: String) -> Void) {
        let sendCodeForgotURL = baseUrl+"api/user/sendCodeForgot"
        AF.request(sendCodeForgotURL, method: .post, parameters: ["email": email], encoding: JSONEncoding.default)
            .validate(statusCode: 200..<401)
            .validate(contentType: ["application/json", "text/html"])
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    guard let jsonData = data as? [String: Any],
                          let statusCode = response.response?.statusCode else {
                        onFailure("Error", "Invalid response format")
                        return
                    }
                    onSuccess("Success", "Password reset code sent to your email.")
                case .failure(let error):
                    print(response.result)
                    onFailure("Error", "Network request failed")
                }
            }
    }
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    
    func verifyCodeForgot(email: String, codeForget: String, onSuccess: @escaping (_ title: String, _ message: String) -> Void, onFailure: @escaping (_ title: String, _ message: String) -> Void) {
        let verifyCodeForgotURL = baseUrl+"api/user/verifyCodeForgot"
        AF.request(verifyCodeForgotURL, method: .post, parameters: ["email": email, "codeForget": codeForget], encoding: JSONEncoding.default)
            .validate(statusCode: 200..<401)
            .validate(contentType: ["application/json", "text/html"])
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    guard let jsonData = data as? [String: Any],
                          let statusCode = response.response?.statusCode else {
                        onFailure("Error", "Invalid response format")
                        return
                    }
                    if let message = jsonData["message"] as? String {
                        onSuccess("Success", message)
                    } else {
                        onFailure("Error", "Failed to verify code")
                    }
                case .failure(let error):
                    print(response.result)
                    onFailure("Error", "Network request failed")
                }
            }
    }
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    func editProfile(email: String, password: String, username: String, onSuccess: @escaping (_ title: String, _ message: String) -> Void, onFailure: @escaping (_ title: String, _ message: String) -> Void) {
        let editProfileURL = baseUrl+"api/user/editProfile" // Update URL
        AF.request(editProfileURL, method: .post, parameters: ["email": email, "password": password, "username": username], encoding: JSONEncoding.default)
            .validate(statusCode: 200..<401)
            .validate(contentType: ["application/json"])
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    guard let jsonData = data as? [String: Any],
                          let statusCode = response.response?.statusCode else {
                        onFailure("Error", "Invalid response format")
                        return
                    }
                    onSuccess("Success", "Profile updated successfully.")
                case .failure(let error):
                    print(error)
                    onFailure("Error", "Network request failed")
                }
            }
    }
    
   
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        
    
    func AddMovie(title: String,
                  genre: String,
                  description: String,
                  adress: String,
                  image: UIImage,
                  onSuccess: @escaping (_ title: String, _ message: String) -> Void,
                  onFailure: @escaping (_ title: String, _ message: String) -> Void) {
        
        let AddMovieURL = baseUrl+"api/movies/add"
        
        let headers: HTTPHeaders = ["Content-type": "multipart/form-data"]
        
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(title.data(using: .utf8)!, withName: "title")
            multipartFormData.append(genre.data(using: .utf8)!, withName: "genre")
            multipartFormData.append(description.data(using: .utf8)!, withName: "description")
            multipartFormData.append(adress.data(using: .utf8)!, withName: "adress")

            
                        if let imageData = image.jpegData(compressionQuality: 0.5) {
                            multipartFormData.append(imageData, withName: "image", fileName: "image.jpeg", mimeType: "image/jpeg")
                        }
            
        }, to: AddMovieURL, usingThreshold: MultipartFormData.encodingMemoryThreshold, method: .post, headers: headers)
        .validate(statusCode: 200..<401)
        .validate(contentType: ["application/json"])
        .responseJSON { response in
            switch response.result {
            case .success(let data):
                guard let jsonData = data as? [String: Any],
                      let statusCode = response.response?.statusCode else {
                    onFailure("Error", "Invalid response format")
                    return
                }
                onSuccess("congrats", "the movie is added succesfully.")
            case .failure(let error):
                print(error)
                onFailure("Error", "Network request failed")
            }
        }
    }
    
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    func getMovies(onSuccess: @escaping (_ movies: [[String: Any]]) -> Void, onFailure: @escaping (_ title: String, _ message: String) -> Void) {
        let getAllMoviesURL = baseUrl+"api/movies/all"
        
        AF.request(getAllMoviesURL)
            .validate(statusCode: 200..<401)
            .validate(contentType: ["application/json"])
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    guard let jsonData = data as? [[String: Any]] else {
                        onFailure("Error", "Invalid response format")
                        return
                    }
                    onSuccess(jsonData)
                case .failure(let error):
                    print(error)
                    onFailure("Error", "Network request failed")
                }
            }
    }
    
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    
        func fetchMovies( completion: @escaping(Result<[Movie],APIError>) -> Void) {
            let url = URL(string : baseUrl+"api/movies/all")
            //createURL(for:   .movie, page: nil, limit: nil)
            fetch(type: [Movie].self, url: url, completion: completion)
            
        }
        
        func fetch<T: Decodable>(type: T.Type, url: URL?, completion: @escaping(Result<T,APIError>) -> Void) {
            
            guard let url = url else {
                let error = APIError.badURL
                completion(Result.failure(error))
                return
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                
                if let error = error as? URLError {
                    completion(Result.failure(APIError.urlSession(error)))
                } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                    completion(Result.failure(APIError.badResponse(response.statusCode)))
                } else if let data = data {
                    
                    do {
                        let result = try JSONDecoder().decode(type, from: data)
                        completion(Result.success(result))
                    } catch {
                        completion(Result.failure(.decoding(error as? DecodingError)))
                    }
                }
            }.resume()
        }
        
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    
    
    
    func createURL(for type: EntityType, page: Int?, limit: Int?) -> URL? {
        
        let baseURL = baseUrl+"api/movies/all"
        var queryItems = [
            //URLQueryItem(name: "term", value: searchTerm),
            URLQueryItem(name: "entity", value: type.rawValue)]
        
        if let page = page, let limit = limit {
            let offset = page * limit
            queryItems.append(URLQueryItem(name: "limit", value: String(limit)))
            queryItems.append(URLQueryItem(name: "offset", value: String(offset)))
        }
        
        var components = URLComponents(string: baseURL)
        components?.queryItems = queryItems
        return components?.url
    }
    
    
    
    
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    func AddEvent(title: String,
                  adress: String,
                  type: String,
                  image: UIImage,
                  onSuccess: @escaping (_ title: String, _ message: String) -> Void,
                  onFailure: @escaping (_ title: String, _ message: String) -> Void) {
        
        let AddEventURL = baseUrl+"api/events/add"
        
        let headers: HTTPHeaders = ["Content-type": "multipart/form-data"]
        
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(title.data(using: .utf8)!, withName: "title")
            multipartFormData.append(adress.data(using: .utf8)!, withName: "adress")
            multipartFormData.append(type.data(using: .utf8)!, withName: "type")
            
            if let imageData = image.jpegData(compressionQuality: 0.5) {
                multipartFormData.append(imageData, withName: "image", fileName: "image.jpeg", mimeType: "image/jpeg")
            }
            
        }, to: AddEventURL, usingThreshold: MultipartFormData.encodingMemoryThreshold, method: .post, headers: headers)
        .validate(statusCode: 200..<401)
        .validate(contentType: ["application/json"])
        .responseJSON { response in
            switch response.result {
            case .success(let data):
                guard let jsonData = data as? [String: Any],
                      let statusCode = response.response?.statusCode else {
                    onFailure("Error", "Invalid response format")
                    return
                }
                onSuccess("congrats", "the event is added succesfully.")
            case .failure(let error):
                print(error)
                onFailure("Error", "Network request failed")
            }
        }
    }
    
    
    
    
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    

    func fetchEvents( completion: @escaping(Result<[Event],APIError>) -> Void) {
        let url = URL(string : baseUrl+"api/events/all")
//        createURL(for:   .movie, page: nil, limit: nil)
        fetche(type: [Event].self, url: url, completion: completion)
    }

    func fetche<T: Decodable>(type: T.Type, url: URL?, completion: @escaping(Result<T,APIError>) -> Void) {

        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in

            if let error = error as? URLError {
                completion(Result.failure(APIError.urlSession(error)))
            } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(response.statusCode)))
            } else if let data = data {

                do {
                    let result = try JSONDecoder().decode(type, from: data)
                    completion(Result.success(result))
                } catch {
                    completion(Result.failure(.decoding(error as? DecodingError)))
                }
            }
        }.resume()
    }


    func createURLe(for type: EntityType, page: Int?, limit: Int?) -> URL? {

        let baseURL = baseUrl+"api/events/all"
        var queryItems = [
            //URLQueryItem(name: "term", value: searchTerm),
            URLQueryItem(name: "entity", value: type.rawValue)]

        if let page = page, let limit = limit {
            let offset = page * limit
            queryItems.append(URLQueryItem(name: "limit", value: String(limit)))
            queryItems.append(URLQueryItem(name: "offset", value: String(offset)))
        }

        var components = URLComponents(string: baseURL)
        components?.queryItems = queryItems
        return components?.url
    }
    
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    
//    func sendAdminRoleRequest(adminEmail: String, onSuccess: @escaping () -> Void, onFailure: @escaping (_ title: String, _ message: String) -> Void) {
//        let sendAdminRoleRequestURL = "https://serverblasti.onrender.com/api/user/mrigel"
//        AF.request(sendAdminRoleRequestURL, method: .post, parameters: ["adminEmail": adminEmail], encoding: JSONEncoding.default)
//            .validate(statusCode: 200..<401)
//            .validate(contentType: ["application/json", "text/html"])
//            .responseJSON { response in
//                print("Response: \(response)")
//
//                switch response.result {
//                case .success(let data):
//                    print("Data: \(data)")
//
//                    if let jsonData = data as? [String: Any], let message = jsonData["message"] as? String {
//                        if message == "Email sent" {
//                            print("Admin role request sent")
//                            onSuccess()
//                        } else {
//                            print("Error sending admin role request")
//                            onFailure("Error", "Error sending admin role request")
//                        }
//                    } else {
//                        print("Data is not a JSON dictionary or missing message")
//                        onFailure("Error", "Invalid response format")
//                    }
//                case .failure(let error):
//                    print("Error: \(error)")
//                    print("Response result: \(response.result)")
//                    onFailure("Error", "Network request failed")
//                }
//            }
//    }


    func sendAdminRoleInvitation(email: String, onSuccess: @escaping (LogedInUser) -> Void, onFailure: @escaping (_ error: Error) -> Void) {
        let url = baseUrl+"api/user/mrigel"
        print(url)

        let parameters: [String: Any] = ["email": email]
        
        AF.request(url, method: .post, parameters: parameters)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                print(response.result)
                switch response.result {
                case .success(let data):
                    if let jsonData = data as? [LogedInUser] {
                        do {
                            let jsonData = try JSONSerialization.data(withJSONObject: jsonData, options: [])
                            let user = try JSONDecoder().decode(LogedInUser.self, from: jsonData)
                            print(user)
                            onSuccess(user)
                            
                        } catch {
                            onFailure(error)
                        }
                    }
                case .failure(let error):
                    onFailure(error)
                }
            }
    }


    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    func fetchFavMovies(id:String ,completion: @escaping ([Movie]?) -> Void) {
        
        
        AF.request(baseUrl+"api/favorite/FavoritefindByUser/"+id).responseDecodable(of: [Movie].self) { response in
            switch response.result {
            case .success(let movies):
                completion(movies)
//                self.movies=movies
                print(movies)
            case .failure(let error):
                print(error.localizedDescription)
                completion(nil)
            }
        }
    }
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
   

}




