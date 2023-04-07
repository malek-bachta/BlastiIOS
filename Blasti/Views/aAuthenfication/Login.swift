//
//  ContentView.swift
//  blastii
//
//  Created by Apple Esprit on 29/3/2023.
//

import SwiftUI

struct Login: View {
    @StateObject var sm = SigninViewModel()
    @State private var WrongEmail = 0
    @State private var Wrongpassword = 0
    @State private var showingLoginScreen = false
    @State private var alertMessage = ""
    @State private var showAlert = false
    @State private var isLoading = false
    @State private var isHomeActive = false


    
    var body: some View {
        NavigationView{
            if (sm.log){
                ProfileView()
            }else{
                
            ZStack {
                
                Color.black
                    .ignoresSafeArea()
                Image("logohori")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150)
                            .offset(x: -125, y: -380)
                           
                Circle()
                    .fill(Color.yellow.opacity(0.2))
                    .frame(width: 100, height: 100)
                    .offset(x: 110, y: 90)
                Circle()
                    .fill(Color.yellow.opacity(0.25))
                    .frame(width: 150, height: 150)
                    .offset(x: 200, y: 300)
                Circle()
                    .fill(Color.yellow.opacity(0.3))
                    .frame(width: 100, height: 100)
                    .offset(x: -200, y: -300)
                
                
                Circle()
                    .fill(Color.yellow.opacity(0.2))
                    .frame(width: 200, height: 200)
                    .offset(x: -150, y: -100)
                Circle()
                    .fill(Color.yellow.opacity(0.15))
                    .frame(width: 350, height: 350)
                    .offset(x: 200, y: -200)
                Circle()
                    .fill(Color.yellow.opacity(0.15))
                    .frame(width: 400, height: 400)
                    .offset(x: -150, y: 300)
               
                VStack{
                    Text("Login")
                        .font(.system(size: 35, design: .rounded).weight(.bold))
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.bottom,18)
                    VStack(alignment: .leading, spacing: 10){
                        Text("Email")
                            .font(.system(size: 20, design: .rounded).weight(.light))
                            .foregroundColor(.white)
                        TextField("Enter Your Email", text: $sm.email)
                            .padding()
                            .frame(width:300, height: 50)
                            .foregroundColor(.white)
                            .background(Color.white.opacity(0.4))
                            .cornerRadius(10)
                            .border(.red,width: CGFloat(WrongEmail))
                            .padding(.bottom,10)
                        Text("Password")
                            .font(.system(size: 20, design: .rounded).weight(.light))
                            .foregroundColor(.white)
                        SecureField("Enter Your Password", text: $sm.password)
                            .padding()
                            .frame(width:300, height: 50)
                            .foregroundColor(.white)
                            .background(Color.white.opacity(0.4))
                            .cornerRadius(10)
                            .border(.red,width: CGFloat(Wrongpassword))
                            .cornerRadius(10)
                            .padding(.bottom,5)
                    }
                    
                    
                    NavigationLink(destination: ForgotPasswordView(), label: {
                        Text("Forget password")
                            .foregroundColor(.red.opacity(0.8))
                            .offset(x:75)
                            .padding(.bottom,15)
                            .font(.system(size: 15, weight:.semibold))
                    })
                    Button(action: {
                        withAnimation {
                            isLoading = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                isLoading = false
                            }
                        }
                        if  verify() {
                            sm.signIn(email: sm.email, password: sm.password)
                            
                        }
                    }) {
                        Text("Login")
                            .foregroundColor(.black)
                            .padding()
                            .frame(width: 200, height: 50)
                            .background(Color.yellow)
                            .cornerRadius(10)
                            .font(.system(size: 20, design: .rounded).weight(.bold))
                        
                    }
                    
                    .padding()
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Invalid Input"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                    }
                    
                    
                    
                    Text("New Here ?  ")
                        .foregroundColor(.white)
                        .offset(x:-30, y:33)
                        .padding(.bottom,8)
                        .font(.system(size: 15, weight: .semibold))
                    
                    NavigationLink(destination: Register().navigationBarBackButtonHidden(), label: {
                        
                        Text("register")
                            .foregroundColor(.yellow)
                            .offset(x:45)
                            .padding(.bottom,8)
                            .font(.system(size: 15, weight: .semibold))
                        
                    })
                    
                    
                }
                             
                }
            }
        }
    }
    
    private func verify() -> Bool {
        let isValid = true
        
        if  sm.email.isEmpty || sm.password.isEmpty {
            alertMessage = "Please fill in all fields."
            showAlert = true
        } else if !isValidEmail(email: sm.email) {
            alertMessage = "Please enter a valid email address."
            showAlert = true
        }
        return isValid
    }
    
   /* private func Signin() {
        sm.signIn(email: sm.email, password: sm.password, onSuccess: { token in
            isHomeActive=true
           
        }, onFailure: {
            alertMessage = "Please enter a valid email address."
            showAlert = true
        })
    }*/
        
    struct ContentView_Previews : PreviewProvider
    {
        static var previews: some View{
            Login()
        }
    }
}
