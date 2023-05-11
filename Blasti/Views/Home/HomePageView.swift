////
////  HomePage.swift
////  Babylo
////
////  Created by Babylo  on 6/4/2023.
////
//
//import SwiftUI
//
//struct HomePage: View {
//
//    var body: some View {
//
//        TabView{
//
//                            HomeView().tabItem(){
////
//                                Image(systemName: "house")
//
//                                Text("Home")
//
//                            }
//
//                            MusicView().tabItem(){
//
//                                Image(systemName: "star.fill")
//
//                                Text("Categories")
//
//                            }
//
//                            ADDView().tabItem(){
//
//                                Image(systemName: "plus.circle")
//                                    .resizable()
//                                    .frame(width: 50,height: 50)
//
//
//                                Text("Add")
//
//                            }
//                            TicketsView().tabItem(){
//
//                                Image(systemName: "ticket.fill")
//
//                                Text("Tickets")
//
//                            }
//
//                            ProfileView().tabItem(){
//
//                                Image(systemName: "person")
//
//                                Text("Profile")
//
//                            }
//
//        }.accentColor(Color("y"))
//
//
//    }
//
//    struct HomePage_Previews: PreviewProvider {
//
//        static var previews: some View {
//
//            HomePage()
//
//        }
//
//    }
//
//}
//
//
//
//struct MusicView: View {
//
//    var body: some View {
//
//        Text("Music Screen")
//
//    }
//
//}
//
//struct ADDView: View {
//
//    var body: some View {
//
//        Text("ADD Screen")
//
//    }
//
//}
//
//
//
//struct AudioBooksView: View {
//
//    var body: some View {
//
//        Text("Audiobooks Screen")
//
//    }
//
//}
//



import SwiftUI

struct HomePage: View {
    
    @StateObject var viewRouter: ViewRouter
    
    @State var showPopUp = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                switch viewRouter.currentPage {
                case .home:
                    HomeView()
                case .categories:
                    Text("Categories")
                case .tickets:
                    TicketsView()
                case .profile:
                    ProfileView()
                case .add:
                    AdminView()
                }
                Spacer()
                ZStack {
                    if showPopUp {
                        PlusMenu(widthAndHeight: geometry.size.width/7)
                            .offset(y: -geometry.size.height/6)
                    }
                    HStack {
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .home, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "homekit", tabName: "Home")
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .categories, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "star.fill", tabName: "Categories")
                        ZStack {
                            Circle()
                                .foregroundColor(Color("x1").opacity(0.1))
                                .frame(width: geometry.size.width/7, height: geometry.size.width/7)
                                .shadow(radius: 4)
                            TabBarIcon(viewRouter: viewRouter, assignedPage: .add, width: geometry.size.width/7-6, height: geometry.size.height/8/2, systemIconName: "circle.fill", tabName: "")
                            
                                .offset(y: 10)
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width/7-6 , height: geometry.size.width/7-6)
                                .foregroundColor(Color("y"))
                                .rotationEffect(Angle(degrees: showPopUp ? 90 : 0))
                        }
                            .offset(y: -geometry.size.height/8/2)
                            .onTapGesture {
                                withAnimation {
                                    showPopUp.toggle()
                                }
                            }
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .tickets, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "ticket.fill", tabName: "Tickets")
//                        TabBarIcon(viewRouter: viewRouter, assignedPage: .add, width: geometry.size.width/7-6, height: geometry.size.height/8/2, systemIconName: "plus.circle.fill", tabName: "Tickets")
//
//
//                            .foregroundColor(Color("y"))
//                            .rotationEffect(Angle(degrees: showPopUp ? 90 : 0))
//                            .offset(y: -geometry.size.height/8/2)
//                            .onTapGesture {
//                                withAnimation {
//                                    showPopUp.toggle()
//                                } }
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .profile, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "person.crop.circle", tabName: "Profile")
                    }
                        .frame(width: geometry.size.width, height: geometry.size.height/8)
                        .background(Color("Color").opacity(0.1).shadow(radius: 2))
                }
            }
                .edgesIgnoringSafeArea(.top)
                .edgesIgnoringSafeArea(.bottom)
}
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage(viewRouter: ViewRouter())
    }
}

struct PlusMenu: View {
    @State var xxx = true

    let widthAndHeight: CGFloat
    
    var body: some View {
        HStack(spacing: 50) {
            Button(action: {}) {
                ZStack {
                    Circle()
                        .foregroundColor(Color("y"))
                        .frame(width: widthAndHeight, height: widthAndHeight)
                    Image(systemName: "record.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(15)
                        .frame(width: widthAndHeight, height: widthAndHeight)
                        .foregroundColor(.black)
                }
            }
            Button(action: {
                self.xxx = true
                print(xxx)
            }) {
                
                    
                    ZStack {
                        Circle()
                            .foregroundColor(Color("y"))
                            .frame(width: widthAndHeight, height: widthAndHeight)
                        Image(systemName: "film")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(15)
                            .frame(width: widthAndHeight, height: widthAndHeight)
                            .foregroundColor(.black)
                    }
                
            }
            if xxx {
                NavigationLink(destination: AdminView(),isActive: $xxx) {EmptyView()}
            }
                
        }
            .transition(.scale)
    }
}

struct TabBarIcon: View {
    
    @StateObject var viewRouter: ViewRouter
    let assignedPage: Page
    
    let width, height: CGFloat
    let systemIconName, tabName: String

    var body: some View {
        VStack {
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
              .padding(.top, 10)
            Text(tabName)
                .font(.footnote)
            Spacer()
        }
            .padding(.horizontal, -4)
            .onTapGesture {
                viewRouter.currentPage = assignedPage
            }
            
            .foregroundColor(viewRouter.currentPage == assignedPage ? Color("y") : .gray)
            .ignoresSafeArea(.all)
    }
}
