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

    @State private var colors = [Color.black, Color("y")]
    @State private var isPresentingConfirm: Bool = false

    
    var body: some View {
        NavigationView {
            
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color("y"),Color("c1"),Color("y").opacity(0.9),Color("c1"),Color("y")]), startPoint: .top, endPoint: .bottomTrailing)
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
                        .padding(.bottom, 100.0)
                        .bold()

                    
                    
                    VStack() {
                        Text("Change Password")
                            .foregroundColor(Color("rev"))
                            .font(.system(size: 20, design: .rounded).weight(.semibold))
                        
                        //.padding(.bottom, 10)
                        CostumSecure(leftIcon : "lock", placeHolder:LocalizedStringKey("OldPassword"), password: $epVM.oldPassword)
                            .onChange(of: epVM.oldPassword) { value in
                                epVM.validateoldPassword()
                            }
                        if let oldpasswordError = epVM.oldpasswordError{
                            Text(oldpasswordError)
                                .foregroundColor(.red).font(.system(size:12)).frame(maxWidth:.infinity, alignment:.leading)
                        }
                        CostumSecure(leftIcon : "lock", placeHolder:LocalizedStringKey("NewPassword"), password: $epVM.newPassword)
                            .onChange(of: epVM.newPassword) { value in
                                epVM.validatenewPassword()
                            }
                        
                        if let newpasswordError = epVM.newpasswordError{
                            Text(newpasswordError)
                                .foregroundColor(.red).font(.system(size:12)).frame(maxWidth:.infinity, alignment:.leading)
                        }
                        CostumSecure(leftIcon : "lock", placeHolder:LocalizedStringKey("ConfirmPassword"), password: $epVM.ConfirmPassword)
                            .onChange(of: epVM.ConfirmPassword) { value in
                                epVM.validateConfirmPassword()
                            }
                        
                        if let confirmpasswordError = epVM.confirmpasswordError{
                            Text(confirmpasswordError)
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
            .navigationBarItems(trailing: Button(action: {
                
                isPresentingConfirm = true
            }) {
                Text("Save")
                    .foregroundColor(Color("y"))
            })
            .confirmationDialog(LocalizedStringKey("AreYouSure"),
                                isPresented: $isPresentingConfirm) {
                Button(LocalizedStringKey("SaveUpdates"), role: .destructive) {
                    epVM.changePasswordHandler()
                    print("performed")
                    epVM.isPresentingUpdated = true
                    
                }
            }
            
        }
    }
    
//    private func saveChanges() {
//        // Validate that new password and confirmation match
//        guard newPassword == confirmNewPassword else {
//            showingAlert = true
//            return
//        }
//
//        // Validate that the current password is correct
//        guard currentPassword == "123456" else {
//            showingAlert = true
//            return
//        }
//
        // Save changes
        // ...
    }


struct ChangePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePasswordView()
    }
}


