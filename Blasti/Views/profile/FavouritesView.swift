////
////  FavouritesView.swift
////  Blasti
////
////  Created by Apple Esprit on 11/5/2023.
////
//
//import SwiftUI
//
//struct FavouritesView: View {
//@StateObject private var vm = ViewModel()
//    var body: some View {
//            NavigationView {
////                ZStack {
//                    
//                    VStack {
//                       
//                        
//                        Button ("Toggle Favorites", action:vm.sortFavs)
//                            .padding()
//                  List() {
//                      ForEach(vm.filteredMovies) { movie in
//                          HStack{
//                              VStack(alignment: .leading) {
//                                  Text(movie.title)
//                                  
//                              }
//                          }
//                      }
////                         reservation in
////                     VStack(alignment: .leading) {
////                         Text(reservation.name)
////                             .font(.system(size: 20, design: .rounded).weight(.semibold))
////                             .foregroundColor(Color("rev"))
////                         Text(reservation.isAccepted )
////                             .padding(.leading,30)
////                             .font(.system(size: 20, design: .rounded).weight(.light))
////
////                             .foregroundColor(getColor(for: reservation.isAccepted))
////
////                         } .listRowSeparatorTint(Color("rev"))
////                             .listRowBackground(getColor(for: reservation.isAccepted).opacity(0.2))
////                     }
////
////
////                 }
////                 .listStyle(.plain)
////                 .background(Image("splash"))
////                 .navigationTitle("Reservations")
////                } .background(Image("splash"))
//         }
//     }
//    }
//}
//
//struct FavouritesView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavouritesView()
//    }
//}
