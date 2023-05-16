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
                
                //Color.black.edgesIgnoringSafeArea(.all)
            
                ForEach(1...50, id: \.self) { i in
                    // Generate a random X and Y coordinate for each dot
                    let randomX = CGFloat.random(in: 0...UIScreen.main.bounds.width)
                    let randomY = CGFloat.random(in: 0...UIScreen.main.bounds.height)
                    
                    // Create a "cool" yellow dot with a size of 20x20 pixels
                    Image(systemName: "circle.fill")
                        .resizable()
                        .foregroundColor(Color("y"))
                        .frame(width: 50, height: 50)
                        .opacity(0.5)
                        .blur(radius: 2)
                        
                        .rotationEffect(.degrees(Double.random(in: 0...360)))
                        .position(x: randomX, y: shouldAnimate ? randomY : UIScreen.main.bounds.height + 20)
                        .scaleEffect(CGFloat.random(in: 0.5...1.5))
                        .animation(Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5).repeatForever(autoreverses: true).delay(Double.random(in: 0...2)))
                }
                
                VStack {
                    HStack {
                        TextField("Search...", text: $searchText)
                            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                            .frame(height: 35)
                            .background(.black.opacity(0.5))
                            .cornerRadius(20)
                        
                        Button(action: {
                            // Handle notifications
                        }) {
                            Image(systemName: "bell")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .foregroundColor(Color("Color"))
                                .padding()
                                .background(.black
                                    .opacity(0.5))
                                .clipShape(Circle())
                        }
                    }
                    .padding(.horizontal, 5)
                    //   .padding(.top, 2)
                    
                    //
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(alignment: .leading) {
                        Text("Movies")
                            .font(.system(size: 35, design: .rounded).weight(.semibold))
                            .fontWeight(.bold)
                            .padding(.top, 40)
                            .padding(.horizontal,20)
                            .foregroundColor(Color("Color"))
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 0) {
                                ForEach(moviesViewModel.movies, id: \.self) { movie in
                                    MovieCardView(movie: movie)
                                    
                                }
                            }
                            
                          //  .padding(.horizontal, 0)
                            //  .padding(.top, 10)
                            .onAppear {
                                print("Movies in HomeView: \(moviesViewModel.movies)")}
                            
                        }
                        
                        Spacer()
                        Text("Events")
                            .font(.system(size: 35, design: .rounded).weight(.semibold))
                            .fontWeight(.bold)
                            .padding(.horizontal,20)
                         //   .padding(.top, 10)
                            .foregroundColor(Color("Color"))
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 5) {
                                ForEach(eventViewModel.events, id: \.self) { event in
                                    EventCardView(event: event)
                                }
                            }
                            
                            .padding(.horizontal, 5)
                           // .padding(.top, 10)
                            .onAppear {
                                print("Movies in HomeView: \(eventViewModel.events)")}
                            
                        }
                        
                        Spacer()
                        
                        Text("Shows")
                            .font(.system(size: 35, design: .rounded).weight(.semibold))
                            .fontWeight(.bold)
                            .padding(.horizontal,20)
                           // .padding(.top, 10)
                            .foregroundColor(.white)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 5) {
                                ForEach(moviesViewModel.movies, id: \.self) { movie in
                                    MovieCardView(movie: movie)
                                }
                            }
                            
                            .padding(.horizontal, 2)
                          //  .padding(.top, 10)
                            .onAppear {
                                print("Movies in HomeView: \(moviesViewModel.movies)")}
                            
                        }
                        
                        Spacer()
                        
                    }
                    }
                    
                }
            }
           
            .navigationBarTitle("Home", displayMode: .inline)
            .navigationBarHidden(true)
            .background(Image("stars")
                .resizable()
                .offset(x:0,y:-59)
                //.ignoresSafeArea()
                .scaledToFill())
                
                //.frame(width: 200, height: 200))
            .onAppear {
                shouldAnimate = true
            }
            
        }

    }
    
}
struct MovieCardView: View {
    let movie: Movie
    @State var showdetail = false
    @State private var VerifFavorite = false


    var body: some View {
        VStack(alignment: .center) {
//            let baseURL = "https://serverblasti.onrender.com/"
            if let url = URL(string: baseUrl+"images/\(movie.image)") {

                                        AsyncImage(url:url) { phase in
                                            switch phase {
                                            case .success(let image):
                                                image
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 200, height:250 )
                                                    .clipShape(Rectangle())
                                                    .cornerRadius(5)

                                                    .clipShape(Rectangle())

                                            case .failure(let error):
                                                Text(error.localizedDescription)

                                            case .empty:
                                                Rectangle().foregroundColor(Color .gray)
                                            @unknown default:
                                                Text("Unknown error")
                                            }
                                        } } else {
                                            Text("Invalid URL")}


             VStack{
                 Button(action: {

                }) {
                Image( systemName: "star.fill")

                        .shadow(color:.white.opacity(0.7), radius: 5, x: 0, y: 2)
                        .foregroundColor(Color("y"))
                .font(.system(size: 25))
                }.padding(EdgeInsets(top: -250, leading: 150, bottom: 0, trailing: 0))
             }

            Text(movie.title)

                .foregroundColor(Color.white)
                .frame(width: 200,height: 50)
               // .cornerRadius(5)
                .background(  LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .top, endPoint: .bottom))
                .offset(x:0,y:-60)

                .font(.system(size: 20, design: .rounded).weight(.semibold))




              }
       .padding(3)
     //   .background(Color.white.opacity(0.2))
        .cornerRadius(5)
        .shadow(color: Color("rev").opacity(0.3), radius: 5, x: 0, y: 4)
        .onTapGesture {
                    showdetail=true
                    let id = UserDefaults.standard.string(forKey: "id")
                }.sheet(isPresented: $showdetail){
                    HotelDetail(movie: movie, VerifFavorite: VerifFavorite)
                }

    }
}




struct EventCardView: View {
    var event: Event

    var body: some View {
        VStack(alignment: .center) {

            if let url = URL(string: baseUrl+"images/\(event.image)") {

                                        AsyncImage(url:url) { phase in
                                            switch phase {
                                            case .success(let image):
                                                image
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 200, height:250 )
                                                    .clipShape(Rectangle())
                                                    .cornerRadius(5)

                                                    .clipShape(Rectangle())

                                            case .failure(let error):
                                                Text(error.localizedDescription)

                                            case .empty:
                                                Rectangle().foregroundColor(Color .gray)
                                            @unknown default:
                                                Text("Unknown error")
                                            }
                                        } } else {
                                            Text("Invalid URL")}


            Text(event.title)
                .foregroundColor(Color.white)
                .font(.system(size: 20, design: .rounded).weight(.light))



            }
       // .padding(20)
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

