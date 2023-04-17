//
//  HomePage.swift
//  Babylo
//
//  Created by Babylo  on 6/4/2023.
//

import SwiftUI

struct HomePage: View {

    var body: some View {

        TabView{

                            HomeView().tabItem(){

                                Image(systemName: "house")

                                Text("Home")

                            }

                            MusicView().tabItem(){

                                Image(systemName: "star.fill")

                                Text("Categories")

                            }

                            AudioBooksView().tabItem(){

                                Image(systemName: "ticket.fill")

                                Text("Tickets")

                            }

                            ProfileView().tabItem(){

                                Image(systemName: "person")

                                Text("Profile")

                            }

        }.accentColor(.yellow)

    }

    struct HomePage_Previews: PreviewProvider {

        static var previews: some View {

            HomePage()

        }

    }

}



struct MusicView: View {

    var body: some View {

        Text("Music Screen")

    }

}



struct AudioBooksView: View {

    var body: some View {

        Text("Audiobooks Screen")

    }

}

