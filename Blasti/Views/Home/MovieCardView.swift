////
////  MovieCardView.swift
////  Blasti
////
////  Created by Siwar Nafti on 16/5/2023.
////
//
//import SwiftUI
//
//struct MovieCardView: View {
//    let movie: Movie
//    @State var showdetail = false
//    @State private var VerifFavorite = false
//
//   
//    var body: some View {
//        VStack(alignment: .center) {
////            let baseURL = "https://serverblasti.onrender.com/"
//            if let url = URL(string: baseUrl+"uploads/posts/\(movie.image)") {
//
//                                        AsyncImage(url:url) { phase in
//                                            switch phase {
//                                            case .success(let image):
//                                                image
//                                                    .resizable()
//                                                    .aspectRatio(contentMode: .fill)
//                                                    .frame(width: 200, height:250 )
//                                                    .clipShape(Rectangle())
//                                                    .cornerRadius(5)
//
//                                                    .clipShape(Rectangle())
//
//                                            case .failure(let error):
//                                                Text(error.localizedDescription)
//
//                                            case .empty:
//                                                Rectangle().foregroundColor(Color .gray)
//                                            @unknown default:
//                                                Text("Unknown error")
//                                            }
//                                        } } else {
//                                            Text("Invalid URL")}
//           
//
//             VStack{
//                 Button(action: {
//                
//                }) {
//                Image( systemName: "star.fill")
//                        
//                        .shadow(color:.white.opacity(0.7), radius: 5, x: 0, y: 2)
//                        .foregroundColor(Color("y"))
//                .font(.system(size: 25))
//                }.padding(EdgeInsets(top: -250, leading: 150, bottom: 0, trailing: 0))
//             }
//                                        
//            Text(movie.title)
//                
//                .foregroundColor(Color.white)
//                .frame(width: 200,height: 50)
//               // .cornerRadius(5)
//                .background(  LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .top, endPoint: .bottom))
//                .offset(x:0,y:-60)
//             
//                .font(.system(size: 20, design: .rounded).weight(.semibold))
//             
//          
//             
//          
//              }
//       .padding(3)
//     //   .background(Color.white.opacity(0.2))
//        .cornerRadius(5)
//        .shadow(color: Color("rev").opacity(0.3), radius: 5, x: 0, y: 4)
//        .onTapGesture {
//                    showdetail=true
//                    let id = UserDefaults.standard.string(forKey: "id")
//                }.sheet(isPresented: $showdetail){
//                    HotelDetail(movie: movie, VerifFavorite: VerifFavorite)
//                }
//        
//    }
//}
//
//
//
//
//
//struct MovieCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieCardView(movie: Movie(_id: "", title: "", description: "", genre: "", image: "", adress: "") )
//    }
//}
