//
//  ForgetPasswordView.swift
//  Blasti
//
//  Created by MacOS on 30/3/2023.
//
import SwiftUI

struct ForgotPasswordView: View {
    @State private var email: String = ""
    @State private var showAlert: Bool = false
    
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
                    .fill(Color.yellow.opacity(0.2))
                    .frame(width: 300, height: 300)
                    .offset(x: 150, y: 200)
                VStack {
                    Text("Forgot Password")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom, 30)
                    VStack(alignment: .leading, spacing: 10){
                        Text("Enter your email")
                            .foregroundColor(.white)
                        TextField("Email", text: $email)
                            .padding()
                            .background(Color.white.opacity(0.4))
                            .frame(width: 300, height: 50)
                            .cornerRadius(10)
                            .padding(.bottom, 20)
                        Button(action: {
                            // Send email to user with reset password link
                            self.showAlert = true
                        }) {
                            Text("Reset Password")
                                .foregroundColor(.black)
                                .padding()
                                .frame(width: 200, height: 50)
                                .background(Color.yellow)
                                .cornerRadius(10)
                        }
                    }
                }
                .padding(.horizontal, 30)
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Password Reset"), message: Text("An email with instructions to reset your password has been sent to \(email)."), dismissButton: .default(Text("OK")))
                }
            }
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
