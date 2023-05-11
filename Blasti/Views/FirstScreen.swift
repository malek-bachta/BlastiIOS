//
//  FirstScreen.swift
//  Blasti
//
//  Created by Apple Esprit on 28/4/2023.
//

import SwiftUI

struct FirstScreen: View {
        
        var body: some View {
            NavigationView(){
                ZStack {
                    Image("fstscreen")
                        .resizable()
                        .ignoresSafeArea()
                        .scaledToFill()
                    //  .frame(width: )
                        .offset(x: 0, y: 0)
                    
                    
                    
                    VStack() {
                       Rectangle()
                            .frame(width: 100, height: 2)
                            .foregroundColor(.white)
                            .padding(.leading, 270.0)
                        
                       
                        Text("WELCOME")
                            .foregroundColor(.white)
                            .padding(.leading, 270.0)
                            .font(.system(size: 25, design: .rounded).weight(.light))
                        
                        Button(action: {}){
                            NavigationLink(destination: Login().navigationBarBackButtonHidden()) {
                                Text("Login")
                                    .foregroundColor(.black)
                                    .padding()
                                    .frame(width: 150, height: 50)
                                    .background(Color("y").opacity(0.9))
                                    .cornerRadius(8)
                                    .font(.system(size: 15, design: .rounded).weight(.light))
                            }
                        }
                        .padding(.leading, 270.0)
                        
                        Button(action: {}) {
                            NavigationLink(destination: Register().navigationBarBackButtonHidden()) {
                                
                                Text("Register")
                                    .foregroundColor(.black)
                                    .padding(.leading)
                                    .frame(width: 150, height: 50)
                                    .background(Color("y").opacity(0.8))
                                    .cornerRadius(8)
                                    .font(.system(size: 15, design: .rounded).weight(.light))
                            }
                        }
                        .padding(.leading, 250.0)
                        
                        
                    }
                }
            }
                }
             
            }
            



struct FirstScreen_Previews: PreviewProvider {
    static var previews: some View {
        FirstScreen()
    }
}
