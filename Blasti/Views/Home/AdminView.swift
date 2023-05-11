//
//  AdminView.swift
//  Blasti
//
//  Created by Apple Esprit on 11/5/2023.
//

import SwiftUI

struct AdminView: View {
    @State var previewIndex = 0
    var body: some View {
        NavigationView {
            ZStack {
                
                VStack {
                    
                    List {
                        Section(header: Text("Welcome to Admin Menu")
                        ){
                            NavigationLink(destination:                             AddMoviesView()) {
                                Label("Add Movie", systemImage: "film")
                                    .foregroundColor(Color("Color"))
                                    .font(.system(size: 20, design: .rounded).weight(.light))
                                
                            }
                            
                            //NavigationLink(destination:  ShowTicket()) {
                            Label("Add Show", systemImage: "star.circle.fill")
                                .foregroundColor(Color("Color"))
                                .font(.system(size: 20, design: .rounded).weight(.light))
                            //     }
                            //       NavigationLink(destination: EventTicket())  {
                            Label("Add Event", systemImage:"music.mic")
                                .foregroundColor(Color("Color"))
                                .font(.system(size: 20, design: .rounded).weight(.light))
                            // }
                            // Add more reservation buttons as needed
                        }                          //.listRowBackground(Color.Color("y").opacity(0.7))
                        //     .foregroundColor(Color.black)
                        .font(.system(size: 20, design: .rounded).weight(.bold))
                        
                    }
                    .listStyle(.inset)
                    .frame(width: 395, height: 300)
                    .offset(x: 0, y: 80)
                    .cornerRadius(10)
                    //   .shadow(radius: 8)
                    
                    
                }
            }
            
            .background(Image("splash")
                .resizable()
                .frame(width: 400, height: 800)
                .offset(x:0,y:-40))
            
                        .ignoresSafeArea(.all)
            
            
            
        }
        }
       
    

    }

struct AdminView_Previews: PreviewProvider {
    static var previews: some View {
        AdminView()
    }
}
