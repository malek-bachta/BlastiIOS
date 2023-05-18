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
    @StateObject var su = SignupViewModel()
    
    @State private var alertMessage = ""
    @State private var showAlert = false
    
    @State private var circle1Offset = CGSize(width: -150, height: -100)
        @State private var circle2Offset = CGSize(width: 200, height: -200)
        @State private var circle3Offset = CGSize(width: -160, height: -390)
        @State private var circle4Offset = CGSize(width: 200, height: 250)
        
        
        
        
    var body: some View {
        NavigationView{
            if (su.sig){
                Login()
            }else{
                ZStack {
                    
                    Color("c1")
                        .ignoresSafeArea()
                    Circle()
                        .fill(Color("y").opacity(0.2))
                        .frame(width: 300, height: 300)
                        .offset(x: -150, y: -100)
                        .animation(Animation.easeInOut(duration: 3).repeatForever(autoreverses: true))

                    Circle()
                        .fill(Color("y").opacity(0.15))
                        .frame(width: 350, height: 350)
                        .offset(x: 200, y: -200)
                        .animation(Animation.easeInOut(duration: 3).repeatForever(autoreverses: true))

                    Circle()
                        .fill(Color("y").opacity(0.15))
                        .frame(width: 150, height: 500)
                        .offset(x: -160, y: -390)
                        .animation(Animation.easeInOut(duration: 3).repeatForever(autoreverses: true))

                    Circle()
                        .fill(Color("y").opacity(0.2))
                        .frame(width: 150, height: 500)
                        .offset(x: 200, y: 250)
                        .animation(Animation.easeInOut(duration: 3).repeatForever(autoreverses: true))

                    Circle()
                        .fill(Color("y").opacity(0.1))
                        .frame(width: 400, height: 400)
                        .offset(x: -150, y: 300)
                        .animation(Animation.easeInOut(duration: 3).repeatForever(autoreverses: true))

                    
                    VStack {
                      
                        Text("Sign Up")
                            .font(.system(size: 35, design: .rounded).weight(.bold))
                            .foregroundColor(Color("rev"))
                            .padding(.top, -100)
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Username")
                                .foregroundColor(Color("rev"))
                                .font(.system(size: 20, design: .rounded).weight(.light))
                            TextField("Enter Your Username", text: $su.username)
                                .padding()
                                .background(Color.white.opacity(0.4))
                                .frame(width: 300, height: 50)
                                .cornerRadius(10)
                            Text("Email")
                                .font(.system(size: 20, design: .rounded).weight(.light))
                                .foregroundColor(Color("rev"))
                            TextField("Enter a Valid Email", text: $su.email)
                                .padding()
                                .background(Color.white.opacity(0.4))
                                .frame(width: 300, height: 50)
                                .cornerRadius(10)
                                .autocapitalization(.none)
                                .keyboardType(.emailAddress)
                                .textContentType(.emailAddress)
                            Text("Password")
                                .font(.system(size: 20, design: .rounded).weight(.light))
                                .foregroundColor(Color("rev"))
                            SecureField("Enter Your password", text: $su.password)
                                .padding()
                                .background(Color.white.opacity(0.4))
                                .frame(width: 300, height: 50)
                                .cornerRadius(10)
                            Text("Verify Password")
                                .font(.system(size: 20, design: .rounded).weight(.light))
                                .foregroundColor(Color("rev"))
                            SecureField("Verify your Password", text: $su.verifPassword)
                                .padding()
                                .background(Color.white.opacity(0.4))
                                .frame(width: 300, height: 50)
                                .cornerRadius(10)
                        }
                        .padding(.bottom, 20)
                        
                        Button(action: {
                            if su.username.isEmpty || su.email.isEmpty || su.password.isEmpty || su.verifPassword.isEmpty {
                                alertMessage = "Please fill in all fields."
                                showAlert = true
                            } else if su.password != su.verifPassword {
                                alertMessage = "Passwords do not match."
                                showAlert = true
                            }else if (!su.email.isValidEmail) {
                                alertMessage = "Please enter a valid email address."
                                showAlert = true
                            }else if !isValidPassword(password: su.password){
                                alertMessage = "Password must contain At least 8 characters in length, one uppercase letter,  one lowercase letter, one number one special character (e.g. !, @, #, $, %, ^, &, *)"
                                showAlert = true
                            }else{
                                su.signUp(email: su.email, password: su.password, username: su.username)
                            }
                        }) {
                            Text("Sign Up")
                                .font(.system(size: 20, design: .rounded).weight(.semibold))
                                .foregroundColor(.black)
                                .padding()
                                .frame(width: 200, height: 50)
                                .background(Color("y"))
                                .cornerRadius(10)
                        }
                        HStack{
                            Text("Already have an acount ?  ")
                                .foregroundColor(Color("rev"))
                                .padding(.bottom,8)
                                .font(.system(size: 15, weight: .semibold))
                            
                            NavigationLink(destination: Login().navigationBarBackButtonHidden(), label: {
                                
                                Text("Login")
                                    .foregroundColor(Color("y"))
                                    .padding(.bottom,8)
                                    .font(.system(size: 15, weight: .semibold))
                                
                            })
                        }.padding(.top )
                       
                    }
                    .padding()
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Invalid Input"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                    }
                    .onAppear {
                                        // start the animations when the view appears
                                        circle1Offset = CGSize(width: 0, height: -250)
                                        circle2Offset = CGSize(width: 0, height: 250)
                                        circle3Offset = CGSize(width: 0, height: -250)
                                        circle4Offset = CGSize(width: 0, height: 250)
                                    }
                                    .onDisappear {
                                        // reset the circle offsets when the view disappears
                                        circle1Offset = CGSize(width: -150, height: -100)
                                        circle2Offset = CGSize(width: 200, height: -200)
                                        circle3Offset = CGSize(width: -160, height: -390)
                                        circle4Offset = CGSize(width: 200, height: 250)
                                    }
                    
                   

                }
            }
        }
    }
}

func isValidPassword(password: String) -> Bool {
    // Use regular expression to validate password format
    let passwordRegex = "^(?=.*[a-zA-Z])(?=.*\\d)[a-zA-Z\\d]{6,}$"
    let passwordPredicate = NSPredicate(format:"SELF MATCHES %@", passwordRegex)
    return passwordPredicate.evaluate(with: password)
}

extension String {
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: self)
    }
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
