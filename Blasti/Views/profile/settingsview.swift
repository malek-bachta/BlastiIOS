//
//  SettignsView.swift
//  Babylo
//
//  Created by Mac2021 on 15/3/2023.
//

import SwiftUI

struct SettignsView: View {
    @State var notifEnabled: Bool = true
    @State var previewIndex = 0
    @State var showUsernameDialog = false
    @State var username = UserDefaults.standard.string(forKey: "username") ?? "username"
    @State var id = UserDefaults.standard.string(forKey: "token") ?? ""
    @State var showpasswordDialog = false
    @State var curentPassword = ""
    @State var newPassword = ""
    @ObservedObject var pvm = ProfileViewModel()
                                            
    @State private var showError = false
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    
    
    @State private var showAlert = false

    
    var body: some View {
        NavigationView {
           
                
                List {
                    Section(header: Text("NOTIFICATIONS")) {
                        Toggle(isOn: $notifEnabled) {
                            Text("Enable notifications")
                        }
                        .toggleStyle(SwitchToggleStyle(tint: !notifEnabled ? Color.gray : Color("y")))
                    }
                    
                    Section(header: Text("Account")) {
                        NavigationLink(destination: EditProfileView(), label: {
                            HStack {
                                Text("Edit profile")
                                    .foregroundColor(Color("settings"))
                                Spacer(minLength: 15)
                            }

                        })
                        
                        NavigationLink(destination: ChangePasswordView(), label: {
                            HStack {
                                Text("Change password")
                                    .foregroundColor(Color("settings"))
                                Spacer(minLength: 15)
                            }

                        })
                        
                       
                    }

                    Section {
                        Button(action: {
                            // Show the "Logout" alert
                            showAlert = true
                        }) {
                            HStack(spacing: 10) {
//                                Image("logout")
//                                    .resizable()
//                                    .frame(width: 20, height: 20)
//                                    .foregroundColor(Color("c"))

                                Text("Logout")
                                    .foregroundColor(Color("settings"))

                                Spacer(minLength: 15)
                                Image(systemName: "chevron.right").foregroundColor(Color("y"))
                            }
                        }
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Logout"), message: Text("Are you sure you want to logout?"), primaryButton: .destructive(Text("Logout"), action: {
                            pvm.logout()
                            let loginView = Login()
                                           UIApplication.shared.windows.first?.rootViewController = UIHostingController(rootView: loginView)
                                      
                        }), secondaryButton: .cancel(Text("Cancel")))
                    }
                }
                .alert(isPresented: $showError) {
                    Alert(title: Text(errorTitle).foregroundColor(.red), message: Text(errorMessage), dismissButton: .default(Text("OK")))
                }
                .navigationTitle("Settings")
                .alert("Change your username", isPresented: $showUsernameDialog, actions: {
                    TextField("Username", text: $username)
                    Button("save", action: {if !username.isEmpty {/*updateUsername()*/}})
                    Button("Cancel", role: .cancel, action: {})
                }, message: {
                    Text("Enter your new username")
                })
                .navigationTitle("Settings")
                .alert("Change your Password", isPresented: $showpasswordDialog, actions: {
                    SecureField("Current password", text: $curentPassword)
                    SecureField("New password", text: $newPassword)
                    Button("save", action: {if !curentPassword.isEmpty && !newPassword.isEmpty {
                        /*updatepassword()*/}})
                    Button("Cancel", role: .cancel, action: {})
                }, message: {
                    
                    
                })}
            
     }
    
   /* func updateUsername() {
        viewModel.updateUsername(token: id , username: username ,onSuccess: { title, message in
            //errorTitle = title
            errorMessage = "error"
            showError = true
        }, onFailure: { title, message in
            // Show dialog with title and message
           // errorTitle = title
            errorMessage = "error"
            showError = true
        })
    }
    
    func updatepassword() {
        viewModel.updatepassword(token:id, password: curentPassword , newpassword :newPassword ,onSuccess: { title, message in
           errorTitle = "title"
            errorMessage = ""
            showError = true
            curentPassword = ""
            newPassword = ""
        }, onFailure: { title, message in
            // Show dialog with title and message
            errorTitle = "title"
            errorMessage = "message"
            showError = true
            curentPassword = ""
            newPassword = ""
        })
    }*/

}



struct SettignsView_Previews: PreviewProvider {
    static var previews: some View {
        SettignsView()
    }
}
