//
//  HomeView.swift
//  Babylo
//
//  Created by Babylo  on 6/4/2023.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText = ""
    @ObservedObject private var moviesViewModel = MoviesViewModel()
    @ObservedObject private var eventViewModel = EventsViewModel()

    @State private var shouldAnimate = false


   
    var body: some View {
        NavigationView {
            ZStack {
                
                Color.black.edgesIgnoringSafeArea(.all)
                ForEach(1...50, id: \.self) { i in
                    // Generate a random X and Y coordinate for each dot
                    let randomX = CGFloat.random(in: 0...UIScreen.main.bounds.width)
                    let randomY = CGFloat.random(in: 0...UIScreen.main.bounds.height)
                    
                    // Create a "cool" yellow dot with a size of 20x20 pixels
                    Image(systemName: "circle.fill")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width: 20, height: 20)
                        .opacity(0.5)
                        .blur(radius: 2)
                        .overlay(
                            Circle()
                                .strokeBorder(style: StrokeStyle(lineWidth: 1, dash: [5]))
                                .foregroundColor(.white)
                        )
                        .rotationEffect(.degrees(Double.random(in: 0...360)))
                        .position(x: randomX, y: shouldAnimate ? randomY : UIScreen.main.bounds.height + 20)
                        .scaleEffect(CGFloat.random(in: 0.5...1.5))
                        .animation(Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5).repeatForever(autoreverses: true).delay(Double.random(in: 0...2)))
                }
                
                VStack {
                    HStack {
                        TextField("Search...", text: $searchText)
                            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                            .frame(height: 40)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(20)
                        
                        Button(action: {
                            // Handle notifications
                        }) {
                            Image(systemName: "bell")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(Color.white)
                                .padding()
                                .background(Color.white.opacity(0.5))
                                .clipShape(Circle())
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                    
//
                    ScrollView(.vertical, showsIndicators: false) {
       
                    Text("Movies")
                        .font(.system(size: 35, design: .rounded).weight(.semibold))
                        .fontWeight(.bold)
                        .padding(.top, 20)
                        .foregroundColor(.white)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                              HStack(spacing: 20) {
                                  ForEach(moviesViewModel.movies, id: \.self) { movie in
                                      MovieCardView(movie: movie)
                            
                                     }
                                  }
                              
                              .padding(.horizontal, 20)
                              .padding(.top, 10)
                              .onAppear {
                                  print("Movies in HomeView: \(moviesViewModel.movies)")}
                            
                          }
                    
                    Spacer()
                    Text("Events")
                        .font(.system(size: 35, design: .rounded).weight(.semibold))
                        .fontWeight(.bold)
                        .padding(.top, 20)
                        .foregroundColor(.white)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                              HStack(spacing: 20) {
                                  ForEach(moviesViewModel.movies, id: \.self) { movie in
                                      MovieCardView(movie: movie)
                                  }
                                  }
                              
                              .padding(.horizontal, 20)
                              .padding(.top, 10)
                              .onAppear {
                                  print("Movies in HomeView: \(eventViewModel.events)")}
                            
                          }
                    
                    Spacer()
                        
                        Text("Shows")
                            .font(.system(size: 35, design: .rounded).weight(.semibold))
                            .fontWeight(.bold)
                            .padding(.top, 20)
                            .foregroundColor(.white)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                                  HStack(spacing: 20) {
                                      ForEach(moviesViewModel.movies, id: \.self) { movie in
                                          MovieCardView(movie: movie)
                                      }
                                      }
                                  
                                  .padding(.horizontal, 20)
                                  .padding(.top, 10)
                                  .onAppear {
                                      print("Movies in HomeView: \(moviesViewModel.movies)")}
                                
                              }
                        
                        Spacer()
                        
                    
                    }  }
            }
            .navigationBarTitle("Home", displayMode: .inline)
            .navigationBarHidden(true)
            .onAppear {
                shouldAnimate = true
            }
             
        }
        
        

    }
    
    
}

struct MovieCardView: View {
    var movie: Movie
   
   
    var body: some View {
        VStack(alignment: .center) {
            let baseURL = "https://serverblasti.onrender.com/"
            if let url = URL(string: baseURL+"uploads/posts\(movie.image)") {

                                        AsyncImage(url:url) { phase in
                                            switch phase {
                                            case .success(let image):
                                                image
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 200, height:250 )
                                                    .clipShape(Rectangle())
                                                    .cornerRadius(10)

                                                    .clipShape(Rectangle())

                                            case .failure(let error):
                                                Text(error.localizedDescription)

                                            case .empty:
                                                Rectangle().foregroundColor(Color .gray).padding(.top,10)
                                            @unknown default:
                                                Text("Unknown error")
                                            }
                                        } } else {
                                            Text("Invalid URL")
                                        }
            
//
//            Image("coverr")
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(width: 200, height:250 )
//                .clipShape(Rectangle())
//                .cornerRadius(10)
        
            /* HStack{
                Button(action: {
                
                }) {
                Image( systemName: "heart.fill")
                
                .foregroundColor(Color.red)
                .frame(width: 10, height: 10)
                .font(.system(size: 30))
                
             }}
             */
            
            Text(movie.title)
                .foregroundColor(Color.white)
                .font(.system(size: 20, design: .rounded).weight(.light))
                
          
                
            }
        .padding(20)
        .background(Color.white.opacity(0.2))
        .cornerRadius(30)
        .shadow(color: .white.opacity(0.5), radius: 5, x: 0, y: 4)
        
    }
}

struct EventCardView: View {
    var event: Event

    var body: some View {
        VStack(alignment: .center) {
            
            Image("coverr")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height:250 )
                .clipShape(Rectangle())
                .cornerRadius(10)
            /* HStack{
                Button(action: {
                
                }) {
                Image( systemName: "heart.fill")
                
                .foregroundColor(Color.red)
                .frame(width: 10, height: 10)
                .font(.system(size: 30))
                
             }}
             */
            
            
            Text(event.title)
                .foregroundColor(Color.white)
                .font(.system(size: 20, design: .rounded).weight(.light))
                
          
                
            }
        .padding(20)
        .background(Color.white.opacity(0.2))
        .cornerRadius(30)
        .shadow(color: .white.opacity(0.5), radius: 5, x: 0, y: 4)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

