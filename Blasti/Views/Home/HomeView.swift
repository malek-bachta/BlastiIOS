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

    init() {
           moviesViewModel.getMovies()
       }
    var body: some View {
        NavigationView {
            ZStack {
                
                Color.black
                    .ignoresSafeArea()
                Circle()
                    .fill(Color.yellow.opacity(0.2))
                    .frame(width: 200, height: 200)
                    .offset(x: 110, y: 90)
                Circle()
                    .fill(Color.yellow.opacity(0.25))
                    .frame(width: 150, height: 150)
                    .offset(x: 200, y: 300)
                Circle()
                    .fill(Color.yellow.opacity(0.15))
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
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color.yellow)
                                .padding()
                                .background(Color.white.opacity(0.5))
                                .clipShape(Circle())
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                    
//                    ZStack {
//                        RoundedRectangle(cornerRadius: 25, style: .continuous)
//                            .fill(Color.white)
//
//                        VStack(alignment: .leading) {
//                            Text("Quote of the day")
//                                .font(.headline)
//                                .foregroundColor(Color.black)
//                                .padding(.bottom, 5)
//
//                            Text("The only limit to our realization of tomorrow will be our doubts of today.")
//                                .font(.body)
//                                .foregroundColor(Color.black)
//                                .padding(.bottom, 20)
//                        }
//                        .padding(EdgeInsets(top: 20, leading: 40, bottom: 20, trailing: 40))
//                    }
//                    .padding(.horizontal, 20)
//                    .padding(.top, 30)
                    
                    Text("Movies")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                        .foregroundColor(.white)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                              HStack(spacing: 20) {
                                  ForEach(moviesViewModel.movies) { movie in
                                      BabyCardView(movie: movie)
                                  }
                                  }
                              
                              .padding(.horizontal, 20)
                              .padding(.top, 20)
                              .onAppear { // Add this block
                                                  print("Movies in HomeView: \(moviesViewModel.movies)")
                                              }
                          }
                    
                    Spacer()
                }
            }
            .navigationBarTitle("Home", displayMode: .inline)
            .navigationBarHidden(true)
            
        }
    }
}

struct BabyCardView: View {
    var movie: Movie

    var body: some View {
        VStack(alignment: .center) {
            Image("moviecover")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 250, height:150 )
                .clipShape(Rectangle())
                .cornerRadius(20)
            
            
            Text(movie.title)
                .foregroundColor(Color.black)
                .font(.headline)
        }
        .padding(20)
        .background(Color.white.opacity(0.5))
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.7), radius: 5, x: 0, y: 4)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

