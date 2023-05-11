//
//  BlastiApp.swift
//  Blasti
//
//  Created by MacOS on 29/3/2023.
//

import SwiftUI

@main
struct BlastiApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

struct SplashScreenView: View {
    @StateObject var viewRouter = ViewRouter()
    @State private var isLoading = true

    var body: some View {
        if isLoading {
            AnimatedBackground()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        isLoading = false
                    }
                }
        } else if UserDefaults.standard.bool(forKey: "RememberMe")  {
            HomePage(viewRouter: viewRouter)
        }else{
            FirstScreen()

        }
    }
}

struct LoginView: View {
    var body: some View {
        Text("Login Page")
    }
}
