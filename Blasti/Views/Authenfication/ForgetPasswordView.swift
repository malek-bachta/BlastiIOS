//
//  ForgotPasswordView.swift
//  Blasti
//
//  Created by MacOS on 30/3/2023.
//
import SwiftUI

struct ForgotPasswordView: View {
    @State private var showAlert: Bool = false
    @State private var showError: Bool = false
    @StateObject var sm = SigninViewModel()

    var body: some View {
        NavigationView {
            if (sm.CodeSent == true) {
                VerifyPasswordKey()
            } else {
                ZStack {
                    Color("c1")
                        .ignoresSafeArea()

                    Circle()
                        .fill(Color("y").opacity(0.2))
                        .frame(width: 300, height: 300)
                        .offset(x: -150, y: -100)
                    Circle()
                        .fill(Color("y").opacity(0.2))
                        .frame(width: 300, height: 300)
                        .offset(x: 150, y: 200)
                    Circle()
                        .fill(Color("y").opacity(0.15))
                        .frame(width: 100, height: 100)
                        .offset(x: -50, y: 100)
                    Circle()
                        .fill(Color("y").opacity(0.1))
                        .frame(width: 50, height: 50)
                        .offset(x: 100, y: -150)

                    VStack {
                        Text("Forgot Password")
                            .font(.system(size: 30, design: .rounded).weight(.bold))
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color("rev"))
                            .padding(.bottom, 30)

                        VStack(alignment: .leading, spacing: 10) {
                            Text("Enter your email")
                                .font(.system(size: 20, design: .rounded).weight(.light))
                                .foregroundColor(Color("rev"))

                            TextField("Email", text: $sm.email)
                                .padding()
                                .background(Color.white.opacity(0.4))
                                .frame(width: 300, height: 50)
                                .cornerRadius(10)
                                .padding(.bottom, 20)

                            if showError {
                                Text("Please enter a valid email address.")
                                    .foregroundColor(.red)
                                    .font(.system(size: 14, design: .rounded).weight(.light))
                                    .padding(.bottom, 10)
                            }

                            Button(action: {
                                if sm.isValidEmail(email: sm.email) {
                                    sm.sendCodeForgot(email: sm.email)
                                    self.showAlert = true
                                } else {
                                    self.showError = true
                                }
                            }) {
                                Text("Send Key")
                                    .font(.system(size: 20, design: .rounded).weight(.light))
                                    .font(.largeTitle)
                                    .bold()
                                    .foregroundColor(Color("y"))
                            }
                        }
                    }
                    .padding(.horizontal, 30)
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Password Reset"), message: Text("An email with instructions to reset your password has been sent to \(sm.email)."), dismissButton: .default(Text("OK")))
                    }
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
