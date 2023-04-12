//
//  ProfileViewModel.swift
//  Blasti
//
//  Created by Siwar Nafti on 12/4/2023.
//

import SwiftUI
import Combine

class ProfileViewModel: ObservableObject {
    @Published var user: User
    @Published var editProfileResult: Result<(title: String, message: String), NSError>?
    private let networkService = NetworkService()

    init(user: User) {
        self.user = user
    }
    func editProfile(email: String, password: String, username: String) {
        networkService.editProfile(email: email, password: password, username: username, onSuccess: { (title, message) in
            DispatchQueue.main.async {
                self.editProfileResult = .success((title, message))
                self.user.email = email
                self.user.password = password
                self.user.username = username
            }
        }, onFailure: { (title, message) in
            DispatchQueue.main.async {
                self.editProfileResult = .failure(NSError(domain: title, code: 0, userInfo: [NSLocalizedDescriptionKey: message]))
            }
        })
    }
}
 


