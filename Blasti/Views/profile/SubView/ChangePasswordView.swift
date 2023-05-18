//
//  editProfile.swift
//  Blasti
//
//  Created by Apple Esprit on 7/4/2023.
//

import Foundation
import SwiftUI
struct ChangePasswordView: View {
    
      
    @ObservedObject var epVM = EditProfileViewModel()
    @State var name: String = ""
    @State var email: String = ""
    @State var bio: String = ""
    @State var currentPassword: String = ""
    @State var newPassword: String = ""
    @State var confirmNewPassword: String = ""
    @State var showingAlert = false
    @State private var colors = [Color.black, Color.yellow]
    
    var body: some View {
        NavigationView {
           
                ZStack{
                    LinearGradient(gradient: Gradient(colors: [.yellow,Color("c1"),.yellow.opacity(0.9),Color("c1"),.yellow]), startPoint: .top, endPoint: .bottomTrailing)
                        .ignoresSafeArea()
                    
                    Rectangle()
                        .fill(Color.black.opacity(0.5))
                                       .shadow(radius: 80)
                                       .frame(width: 400, height: 900)
                                       .ignoresSafeArea()
                    
                    VStack (alignment: .center, spacing: 5){
                        
                            Text("Password")
                                .font(.system(size: 30, design: .rounded).weight(.bold))
                                
                                .foregroundColor(Color("rev"))
                                .padding()
                       
                        
                            VStack() {
                                Text("Change Password")
                                .foregroundColor(Color("rev"))
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
                .navigationBarItems(trailing: Button(action: {
                    if (!(name.isEmpty)) {
                        epVM.user.username  = name
                    }
                    if !(email.isEmpty) {
                        epVM.user.email = email
                    }
                    epVM.updateprofil(user: epVM.user)
                }) {
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

struct ChangePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePasswordView(name: "John Doe", email: "john.doe@example.com", bio: "Hello, world!", currentPassword: "", newPassword: "", confirmNewPassword: "")
    }
}


