//
//  EditProfileVM.swift
//  FormulaOneAppAR
//
//  Created by Siwar Nafti on 9/4/2023.
//
import PhotosUI
import SwiftUI

import Foundation
class EditProfileViewModel:ObservableObject{
    @Published var message:LocalizedStringKey=""
    @Published var oldPassword:String=""
    @Published var newPassword:String=""
    @Published var ConfirmPassword:String=""
    @Published var newpasswordError:LocalizedStringKey?=nil
    @Published var confirmpasswordError:LocalizedStringKey?=nil
    @Published var oldpasswordError:LocalizedStringKey?=nil
    @Published var invalid:Bool=false
    @Published var profilehaschanged:Bool=false
    @Published var isPresentingUpdated: Bool = false
    @Published var avatarItem: PhotosPickerItem?
    @Published var avatarImage: Image?
    @Published var shouldShowImagePicker = false
    @Published var image: UIImage?
    @Published  var isPresentingConfirm: Bool = false
    @Published  var isPresentingAlert: Bool = false
    var userchangepasswor=UserChangePassword()
    var user = LogedInUser()
    
    init(){
        user = user.getuser() ?? LogedInUser()
    }
    
    func logout() {
        print("Logging out user...")
        
        self.removeuser()
        user = LogedInUser()
        UserDefaults.standard.set(false, forKey: "RememberMe")
        
        print("User logged out successfully.")
    }
    
   
    
    
    func validateoldPassword() {
        if oldPassword.isEmpty {
            oldpasswordError = LocalizedStringKey("PasswordIsRequired")
        } else if oldPassword.count < 8 {
            oldpasswordError = LocalizedStringKey("PasswordMustBeAtLeast8characters")
        } else {
            oldpasswordError = nil
        }
    }
    func validatenewPassword() {
        if newPassword.isEmpty {
            newpasswordError = LocalizedStringKey("PasswordIsRequired")
        } else if newPassword.count < 8 {
            newpasswordError = LocalizedStringKey("PasswordMustBeAtLeast8characters")
        } else {
            newpasswordError = nil
        }
    }

func validateConfirmPassword() {
    if self.ConfirmPassword.isEmpty {
        confirmpasswordError = LocalizedStringKey("PasswordIsRequired")
    } else if ConfirmPassword != self.newPassword {
        confirmpasswordError = LocalizedStringKey("PasswordsMustMatch")
    } else {
        confirmpasswordError = nil
    }
}
    
    func logPresseded(){
        profilehaschanged=false
    }
    func updateprofil(user:LogedInUser) {
        print(user)
        if(user.email.isValidEmail){
            updateprofilApi(user:user){ result in
                
                DispatchQueue.main.async {
                    self.invalid=true
                    self.profilehaschanged=true
                }
                print(result)
            }
        }else{
            print("malek")
            DispatchQueue.main.async {
                self.message = LocalizedStringKey("EmailIsInvalid")
                self.invalid=true
            }
        }
    }
    func changePasswordHandler() {
        userchangepasswor.email=user.email
        userchangepasswor.newPassword=newPassword
        userchangepasswor.oldPassword=oldPassword
        print(userchangepasswor)
        self.changePasswordApi(user:userchangepasswor) { result in
                switch result {
                case .success:
                    DispatchQueue.main.async {
                        self.message = LocalizedStringKey("PasswordHasChanged")
                        self.invalid = true}
                case .failure(let error):
                    print(error.localizedDescription)
                    DispatchQueue.main.async {
                        self.message = LocalizedStringKey("FailedPleaseTryAgain")
                        self.invalid = true}
                }
                print(result)
            }
        
    }

    func updateprofilApi(user:LogedInUser, completion: @escaping (Result<String, APIError>) -> Void) {
        self.profilehaschanged=true
           guard let url = URL(string: baseUrl+"api/user/edit") else {
               completion(.failure(.badURL))
               return
           }
           var request = URLRequest(url: url)
           request.httpMethod = "POST"
           request.addValue("application/json", forHTTPHeaderField: "Content-Type")
           request.httpBody = try? JSONEncoder().encode(user)
        
        print("1")
           
        URLSession.shared.dataTask(with: request) { (data, response, error) in
                    guard let httpResponse = response as? HTTPURLResponse else {
                            return
                        }
            switch httpResponse.statusCode {
            case 200...299:
                print("2")
                if(error != nil) {
                    return
                }
                do {
                    if let data=data {
                        self.saveuser(user: user)
                        completion(.success("done"))}
                    else{
                        print("no data")
                    }
                }catch let jsonerror {
                    print(jsonerror)
                }
            case 422:
                completion(.failure(.ivalidlogin))
            case 403...499:
                completion(.failure(.ivalidlogin))
                // Handle client error
            case 500...599:
                completion(.failure(.unknown))
                // Handle server error
            default:
                completion(.failure(.invalidCredentials))
            }
        }.resume()
           
       }
    func changePasswordApi(user:UserChangePassword, completion: @escaping (Result<String, APIError>) -> Void) {
        
           guard let url = URL(string: baseUrl+"api/user/ChangePassword") else {
               completion(.failure(.badURL))
               return
           }
           var request = URLRequest(url: url)
           request.httpMethod = "POST"
           request.addValue("application/json", forHTTPHeaderField: "Content-Type")
           request.httpBody = try? JSONEncoder().encode(user)
        
        print("1")
           
        URLSession.shared.dataTask(with: request) { (data, response, error) in
                    guard let httpResponse = response as? HTTPURLResponse else {
                            return
                        }
            switch httpResponse.statusCode {
            case 200...299:
                print("2")
                completion(.success("done"))
            case 422:
                completion(.failure(.ivalidlogin))
            case 403...499:
                completion(.failure(.ivalidlogin))
                // Handle client error
            case 500...599:
                completion(.failure(.unknown))
                // Handle server error
            default:
                completion(.failure(.invalidCredentials))
            }
        }.resume()
           
       }
    func saveuser(user:LogedInUser){
           let defaults = UserDefaults.standard
           let encoder = JSONEncoder()
           if let encoded = try? encoder.encode(user) {
               defaults.set(encoded, forKey: "user")
           }
       }
    func removeuser(){
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "user")
    }
    
}
