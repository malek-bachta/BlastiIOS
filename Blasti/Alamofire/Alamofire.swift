//
//  Alamofire.swift
//  Blasti
//
//  Created by MacOS on 30/3/2023.
//

import Alamofire

class APIManager {
    static let shared = APIManager()
    private let baseURL = "https://serverblasti.onrender.com"
    
    private init() { }
    
    func signUp(username: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        let signUpURL = "\(baseURL)/signup"
        let parameters = ["username": username, "password": password]
        
        AF.request(signUpURL, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            switch response.result {
            case .success(let data):
                let signUpResponse = try? JSONDecoder().decode(SignUpResponse.self, from: response.data!)
                if signUpResponse?.success == true {
                    completion(.success(()))
                } else {
                    completion(.failure(MyError.signupFailed))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

struct SignUpResponse: Codable {
    let success: Bool
}
