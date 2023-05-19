//
//  editProfile.swift
//  Blasti
//
//  Created by Apple Esprit on 7/4/2023.
//

import Foundation
import SwiftUI
struct ResetPassword: View {
   
        @State var currentPassword = ""
        @State var newPassword = ""
        @State var confirmNewPassword = ""
        @State var showingAlert = false
        @State private var colors = [Color.black, Color("y")]
    @ObservedObject var svm:SigninViewModel


        var body: some View {
            NavigationView {
                if (svm.CodeSent) {
                    Login()	
                } else {
                ZStack {
                    Color("c1")
                        .ignoresSafeArea()
                    
                    Circle()
                        .fill(Color("y").opacity(0.2))
                        .frame(width: 100, height: 100)
                        .offset(x: 110, y: 90)
                    
                    Circle()
                        .fill(Color("y").opacity(0.25))
                        .frame(width: 150, height: 150)
                        .offset(x: 200, y: 300)
                    
                    Circle()
                        .fill(Color("y").opacity(0.3))
                        .frame(width: 100, height: 100)
                        .offset(x: -200, y: -300)
                    
                    Circle()
                        .fill(Color("y").opacity(0.2))
                        .frame(width: 200, height: 200)
                        .offset(x: -150, y: -100)
                    
                    Circle()
                        .fill(Color("y").opacity(0.15))
                        .frame(width: 350, height: 350)
                        .offset(x: 200, y: -200)
                    
                    Circle()
                        .fill(Color("y").opacity(0.15))
                        .frame(width: 400, height: 400)
                        .offset(x: -150, y: 300)
                        .shadow(radius: 80)
                        .offset(x: 0, y: 170)
                    
                    
                    VStack {
                        Text("Reset Password")
                            .foregroundColor(Color("rev"))
                            .font(.system(size: 30, design: .rounded).weight(.semibold))
                            .font(.largeTitle)
                            .bold()
                            .padding(.bottom, 100.0)
                        
                        VStack() {
                            Text("Change Password")
                                .foregroundColor(Color("rev"))
                                .font(.system(size: 20, design: .rounded).weight(.semibold))
                            
                            //.padding(.bottom, 10)
                            TextField(LocalizedStringKey("VerificationCode"), text: $svm.verificationcode)
                                .font(.title3)
                                .padding()
                                .cornerRadius(10.0)
                                .shadow(color: Color.white.opacity(0.3), radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                                .onChange(of: svm.verificationcode) { value in
                                    svm.validateverificationcode()
                                }
                            if let verificationcodeError = svm.verificationcodeError{
                                Text(verificationcodeError)
                                    .foregroundColor(.red).font(.system(size:12)).frame(maxWidth:.infinity, alignment:.leading)
                            }
                            CostumSecure(leftIcon : "lock", placeHolder:LocalizedStringKey("Password"), password: $svm.password)
                                .onChange(of: svm.password) { value in
                                    svm.validatePassword()
                                }
                            
                            if let passwordError = svm.passwordError{
                                Text(passwordError)
                                    .foregroundColor(.red).font(.system(size:12)).frame(maxWidth:.infinity, alignment:.leading)
                            }
                            CostumSecure(leftIcon : "lock", placeHolder:LocalizedStringKey("ConfirmPassword"), password: $svm.confirmPassword)
                                .onChange(of: svm.confirmPassword) { value in
                                    svm.validateConfirmPassword()
                                }
                            
                            if let confirmPasswordError = svm.confirmPasswordError{
                                Text(confirmPasswordError)
                                    .foregroundColor(.red).font(.system(size:12)).frame(maxWidth:.infinity, alignment:.leading)
                            }
                        }
                        .padding()
                        .background(Color.white.opacity(0.4))
                        .cornerRadius(10)
                        .shadow(radius: 40)
                        .frame(width: 350, height: 200)
                        
                    }
                }
                
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: Button(action:
                                                        svm.confirmForgotPwd
                                                     
                                                    ) {
                    Text("Save")
                        .font(.system(size: 20, design: .rounded).weight(.light))
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color("y"))
                })
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Error"), message: Text("There was an error saving your changes."), dismissButton: .default(Text("OK")))
                }
            }
            }
        }

        private func saveChanges() {
            // Validate that new password and confirmation match
            guard newPassword == confirmNewPassword else {
                showingAlert = true
                return
            }

            // Validate that the current password is correct
            guard currentPassword == "123456" else {
                showingAlert = true
                return
            }

            // Save changes
            // ...
        }
    }

//    struct EdittProfileView_Previews: PreviewProvider {
//        static var previews: some View {
//            ResetPassword(currentPassword: "", newPassword: "", confirmNewPassword: "")
//        }
//    }

      
    
