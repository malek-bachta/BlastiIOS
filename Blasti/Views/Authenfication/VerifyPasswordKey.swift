//
//  VerifyPasswordKey.swift
//  Blasti
//
//  Created by Apple Esprit on 11/4/2023.
//

import Foundation
import SwiftUI

struct VerifyPasswordKey: View {

    @State var passwordKey = ""
    @State var showingAlert = false
    @State private var colors = [Color.black, Color.yellow]

    var body: some View {
        NavigationView {
            ZStack {
                Color("c1")
                    .ignoresSafeArea()

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
                    .shadow(radius: 80)
                    .offset(x: 0, y: 170)

                VStack {
                    Text("Verify Password Key")
                        .foregroundColor(Color("rev"))
                        .font(.system(size: 30, design: .rounded).weight(.semibold))
                        .font(.largeTitle)
                        .bold()

                    VStack {
                        TextField("Enter Password Key", text: $passwordKey)
                            .keyboardType(.numberPad)
                    }
                    .padding(20)
                    .background(Color.white.opacity(0.4))
                    .cornerRadius(10)
                    .shadow(radius: 40)
                    .frame(width: 350, height: 100)

                }
            }

            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button(action: verifyKey) {
                Text("Verify")
                    .font(.system(size: 20, design: .rounded).weight(.light))
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.yellow)

            })
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Error"), message: Text("The password key you entered is incorrect."), dismissButton: .default(Text("OK")))
            }
        }
    }

    private func verifyKey() {
        // Check if the entered password key is correct
        guard passwordKey == "123456" else {
            showingAlert = true
            return
        }

        // Perform actions after successful verification
        // ...
    }
}

struct VerifyPasswordKey_Previews: PreviewProvider {
    static var previews: some View {
        VerifyPasswordKey(passwordKey: "")
    }
}
