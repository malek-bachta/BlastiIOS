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
                        Color.black
                            .ignoresSafeArea()
                    
                    VStack {
                        Form {
                            Section(header: Text("Name")) {
                                TextField("Enter your name", text: $name)
                            }
                            .listRowBackground(Color.yellow.opacity(0.7))
                            Section(header: Text("Email")) {
                                TextField("Enter your email", text: $email)
                                    .keyboardType(.emailAddress)
                            }
                            .listRowBackground(Color.yellow.opacity(0.7))
                            Section(header: Text("Bio")) {
                                TextEditor(text: $bio)
                                    .frame(minHeight: 100)
                            } .listRowBackground(Color.yellow.opacity(0.7))
                            
                            Section(header: Text("Change Password")) {
                                SecureField("Current Password", text: $currentPassword)
                                SecureField("New Password", text: $newPassword)
                                SecureField("Confirm New Password", text: $confirmNewPassword)
                            }
                            .listRowBackground(Color.yellow.opacity(0.7))
                        }
                    }
                }
                .navigationBarTitle("Edit Profile")
                .navigationBarItems(trailing: Button(action: saveChanges) {
                    Text("Save")
                        .colorMultiply(.green)
                })
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Error"), message: Text("There was an error saving your changes."), dismissButton: .default(Text("OK")))
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
