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
    
    var body: some View {
        NavigationView{
            ZStack {
                
                Color.black
                    .ignoresSafeArea()
                Image("logoo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80)
                            .offset(x: 0, y: -300)
                           
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
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.bottom,18)
                    VStack(alignment: .leading, spacing: 10){
                        Text("Email")
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
                        if  sm.email.isEmpty || sm.password.isEmpty {
                            alertMessage = "Please fill in all fields."
                            showAlert = true
                        } else if !isValidEmail(email: sm.email) {
                            alertMessage = "Please enter a valid email address."
                            showAlert = true
                        }else{
                            sm.signIn(email: sm.email, password: sm.password)
                        }
                    }) {
                        Text("Login")
                            .foregroundColor(.black)
                            .padding()
                            .frame(width: 200, height: 50)
                            .background(Color.yellow)
                            .cornerRadius(10)
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
                    
                    NavigationLink(destination: Register(), label: {

                        Text("register")
                            .foregroundColor(.yellow)
                            .offset(x:45)
                            .padding(.bottom,8)
                            .font(.system(size: 15, weight: .semibold))
                        
                    })
                    
                    
                    NavigationLink (destination: Text("you are logged in  @\(sm.email)"), isActive: $showingLoginScreen){
                        EmptyView()
                    }
                             
                }
            }
            .navigationBarHidden(true)
        }
    }
    func autheticateUser(username:String, password:String){
         if username.lowercased()=="dorra05"
        {
             WrongEmail = 0
             if password.lowercased() ==    "dorra123"
             {
                 Wrongpassword = 0
                 showingLoginScreen = true
             }
             else
                {
                 Wrongpassword = 2
                }
         }
            else{
                WrongEmail = 2
                }
    }
        
    struct ContentView_Previews : PreviewProvider
    {
        static var previews: some View{
            Login()
        }
    }
}
