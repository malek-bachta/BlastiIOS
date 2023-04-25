//
//  MovieTicket.swift
//  Blasti
//
//  Created by Apple Esprit on 19/4/2023.
//

import SwiftUI

struct MovieTicket: View {
    var body: some View {
       
        
                NavigationView {
                    ZStack {
                        VStack {
                            HStack {
                                Button(action: {
                                }) {
                                    
                                    Label("", systemImage: "")
                                        .font(.system(size: 40, design: .rounded).weight(.semibold))
                                        .foregroundColor(.white)
                                        .padding()
                                
                            }
                            Spacer()
                            
                            Button(action: {}) {
                                NavigationLink(destination: SettignsView().navigationBarBackButtonHidden()) {
                                    Label("", systemImage: "gear")
                                        .font(.system(size: 40, design: .default).weight(.semibold))
                                        .offset(x: 5,y:-20)
                                        .foregroundColor(Color("AccentColor"))
                                        
                                }
                            }
                        }
                      .padding(.top, 20)
                        .padding(.horizontal, 10)
                        
                        Spacer()
                    }
                   
                        HStack {
                            Text("Movie Name")
                                .foregroundColor(Color("Color"))
                                .shadow(radius: 100)
                                .offset(x: 0, y: -55)
                                .font(.system(size: 30, design: .rounded).weight(.semibold))
                                                    
                        }
                            HStack {
                                Text("01/06/2023")
                                    .foregroundColor(Color("Color"))
                                    .shadow(radius: 100)
                                    .offset(x: 0, y: -25)
                                    .font(.system(size: 20, design: .rounded).weight(.light))
                                                        
                            }
                                                    
                            
                        Image("coverr")
                                .centerCropped()
                          //  .resizable()
                            .scaledToFit()
                            .frame(width: 230, height: 230)
                            .offset(x: 0, y: -190)
                            .padding()
                          //  .shadow(radius: 100)
                            
                        
                    }
                    .background(Image("bgticketfilm")
                        .resizable()
                       .frame(width: 450, height: 840)
                        .offset(x:0,y:0))
                        
                        .ignoresSafeArea(.all)
                    
     
            }
        }

    }
extension Image {
    func centerCropped() -> some View {
        GeometryReader { geo in
            self
            .resizable()
            .scaledToFill()
            .frame(width: geo.size.width, height: geo.size.height)
            .clipped()
        }
    }
}

struct MovieTicket_Previews: PreviewProvider {
    static var previews: some View {
        MovieTicket()
    }
}
