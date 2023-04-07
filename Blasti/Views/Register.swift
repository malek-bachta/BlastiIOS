//
//  Register.swift
//  Blasti
//
//  Created by MacOS on 30/3/2023.
//


import SwiftUI
import CoreData
import Foundation


struct Register: View {
    @StateObject var sm = SignupViewModel()
    
    @State private var alertMessage = ""
    @State private var showAlert = false
        
        
        
    var body: some View {
        NavigationView{
            ZStack {
                Color.black
                    .ignoresSafeArea()
                Circle()
                    .fill(Color.yellow.opacity(0.2))
                    .frame(width: 300, height: 300)
                    .offset(x: -150, y: -100)
                Circle()
                    .fill(Color.yellow.opacity(0.15))
                    .frame(width: 350, height: 350)
                    .offset(x: 200, y: -200)
                Circle()
                    .fill(Color.yellow.opacity(0.15))
                    .frame(width: 150, height: 500)
                    .offset(x: -160, y: -390)
                Circle()
                    .fill(Color.yellow.opacity(0.2))
                    .frame(width: 150, height: 500)
                    .offset(x: 200, y: 250)
                Circle()
                    .fill(Color.yellow.opacity(0.1))
                    .frame(width: 400, height: 400)
                    .offset(x: -150, y: 300)
                
                VStack {
                    Text("Sign Up")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, -100)
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Username")
                            .foregroundColor(.white)
                        TextField("Enter Your Username", text: $sm.username)
                            .padding()
                            .background(Color.white.opacity(0.4))
                            .frame(width: 300, height: 50)
                            .cornerRadius(10)
                        Text("Email")
                            .foregroundColor(.white)
                        TextField("Enter a Valid Email", text: $sm.email)
                            .padding()
                            .background(Color.white.opacity(0.4))
                            .frame(width: 300, height: 50)
                            .cornerRadius(10)
                            .autocapitalization(.none)
                            .keyboardType(.emailAddress)
                            .textContentType(.emailAddress)
                        Text("Password")
                            .foregroundColor(.white)
                        SecureField("Enter Your password", text: $sm.password)
                            .padding()
                            .background(Color.white.opacity(0.4))
                            .frame(width: 300, height: 50)
                            .cornerRadius(10)
                        Text("Verify Password")
                            .foregroundColor(.white)
                        SecureField("Verify your Password", text: $sm.verifPassword)
                            .padding()
                            .background(Color.white.opacity(0.4))
                            .frame(width: 300, height: 50)
                            .cornerRadius(10)
                    }
                    .padding(.bottom, 20)
                    Button(action: {
                        if sm.username.isEmpty || sm.email.isEmpty || sm.password.isEmpty || sm.verifPassword.isEmpty {
                            alertMessage = "Please fill in all fields."
                            showAlert = true
                        } else if sm.password != sm.verifPassword {
                            alertMessage = "Passwords do not match."
                            showAlert = true
                        }else if !isValidEmail(email: sm.email) {
                            alertMessage = "Please enter a valid email address."
                            showAlert = true
                        }else if !isValidPassword(password: sm.password){
                            alertMessage = "Password must contain At least 8 characters in length, one uppercase letter,  one lowercase letter, one number one special character (e.g. !, @, #, $, %, ^, &, *)"
                            showAlert = true
                        }else{
                            sm.signUp(email: sm.email, password: sm.password, username: sm.username)
                        }
                    }) {
                        Text("Sign Up")
                            .foregroundColor(.black)
                            .padding()
                            .frame(width: 200, height: 50)
                            .background(Color.yellow)
                            .cornerRadius(10)
                    }
                }
                .padding()
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Invalid Input"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
            }
        }
    }
}

func isValidPassword(password: String) -> Bool {
    // Use regular expression to validate password format
    let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$"
    let passwordPredicate = NSPredicate(format:"SELF MATCHES %@", passwordRegex)
    return passwordPredicate.evaluate(with: password)
}

func isValidEmail(email: String) -> Bool {
    // Use regular expression to validate email address format
    let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
    return emailPredicate.evaluate(with: email)
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
