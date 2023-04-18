//
//  editProfile.swift
//  Blasti
//
//  Created by Apple Esprit on 7/4/2023.
//

import Foundation
import SwiftUI
struct EditProfileView: View {
    
      
    
    @State var name: String
    @State var email: String
    @State var bio: String
    @State var currentPassword: String
    @State var newPassword: String
    @State var confirmNewPassword: String
    @State var showingAlert = false
    @State private var colors = [Color.black, Color.yellow]
    
    var body: some View {
        NavigationView {
           
                ZStack{
                    LinearGradient(gradient: Gradient(colors: [.yellow,.black,.yellow,.black, .yellow]), startPoint: .top, endPoint: .bottomTrailing)
                        
                        .ignoresSafeArea()
                   
                    
                    VStack (alignment: .leading, spacing: 5){
                        
                            Text("Edit Profile")
                                .font(.system(size: 30, design: .rounded).weight(.bold))
                                
                                .foregroundColor(.white)
                                .padding()
                        VStack (alignment: .leading, spacing: 10){
                            Text("Name")
                                .padding()
                            
                                .font(.system(size: 20, design: .rounded).weight(.light))
                                .foregroundColor(.white)
                            TextField("Change name", text: $name)
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.white.opacity(0.4))
                                .frame(width: 350, height: 50)
                                .cornerRadius(10)
                            
                                        
                            Text("Email")
                                .font(.system(size: 20, design: .rounded).weight(.light))
                                .foregroundColor(.white)
                                .padding()
                            TextField("", text: $email)
                                .padding()
                                .background(Color.white.opacity(0.4))
                                .frame(width: 350, height: 50)
                                .cornerRadius(10)
                            
                                .foregroundColor(.white)
                           }
                        
                            VStack() {
                                Text("Change Password")
                                                                    .foregroundColor(.white)
                                .font(.system(size: 20, design: .rounded).weight(.semibold))
                               
                                    //.padding(.bottom, 10)
                                SecureField("Current Password", text: $currentPassword)
                                SecureField("New Password", text: $newPassword)
                                SecureField("Confirm New Password", text: $confirmNewPassword)
                            }
                            .padding()
                            .background(Color.white.opacity(0.4))
                            .cornerRadius(10)
                            .shadow(radius: 40)
                            .frame(width: 350, height: 200)
                            
                        }

                    
                }
                .navigationBarItems(trailing: Button(action: saveChanges) {
                    Text("Save")
                        .foregroundColor(.yellow)
                })
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Couldn't Save"), message: Text("There was an error saving your changes."), dismissButton: .default(Text("OK")))
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

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(name: "John Doe", email: "john.doe@example.com", bio: "Hello, world!", currentPassword: "", newPassword: "", confirmNewPassword: "")
    }
}
