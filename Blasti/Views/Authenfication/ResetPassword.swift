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

        var body: some View {
            NavigationView {
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
                          
                        VStack {
                            Text("Change Password")
                                .foregroundColor(Color("rev"))
                                .font(.system(size: 15, design: .rounded).weight(.semibold))
                                //.padding(.bottom, 10)
                            SecureField("Current Password", text: $currentPassword)
                            SecureField("New Password", text: $newPassword)
                            SecureField("Confirm New Password", text: $confirmNewPassword)
                        }
                        .padding(20)
                        .background(Color("rev").opacity(0.2))
                        .cornerRadius(10)
                        .shadow(radius: 40)
                        .frame(width: 350, height: 200)

                    }
                }
           
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: Button(action: saveChanges) {
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

    struct EdittProfileView_Previews: PreviewProvider {
        static var previews: some View {
            ResetPassword(currentPassword: "", newPassword: "", confirmNewPassword: "")
        }
    }

      
    
