//
//  HotelDetail.swift
//  MyProject
//
//  Designed in DetailsPro
//  Copyright © (My Organization). All rights reserved.
//

import SwiftUI
import MapKit
import CoreImage.CIFilterBuiltins


struct HotelDetail: View {
    @StateObject var mm = MoviesViewModel()
    
    @State private var region = MKCoordinateRegion()
    @State private var qrCodeData: String = ""

    let movie: Movie
    
    var body: some View {
        NavigationView(){
            ZStack(alignment: .center) {
                LinearGradient(gradient: Gradient(colors: [.black, .yellow.opacity(0.7)]), startPoint: .top, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                ScrollView {
                    
                    VStack {
                        ZStack(alignment: .top) {
                            
                            if let url = URL(string: baseUrl+"images/\(movie.image)") {
                                                
                                AsyncImage(url:url) { phase in
                                    switch phase {
                                    case .success(let image):
                                        image
                                            .renderingMode(.original)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 390, height: 320)
                                            .clipped()
                                            .shadow(radius: 20)
                                    case .failure(let error):
                                        Text(error.localizedDescription)
                                    case .empty:
                                        Rectangle().foregroundColor(Color .gray)
                                    @unknown default:
                                        Text("Unknown error")
                                    }
                                    
                                } } else {
                                    Text("Invalid URL")
                                }
                            HStack {
                                Image(systemName: "arrow.backward")
                                    .font(.title3)
                                    .padding(11)
                                    .background {
                                        Circle()
                                            .fill(Color("y").opacity(0.7))
                                    }
                                Spacer()
                            }
                            .padding()
                            .padding(.top, 44)
                        }
                        .frame(width: 390, height: 320)
                        .clipped()
                        VStack(alignment: .leading, spacing: 4) {
                            HStack(alignment: .firstTextBaseline) {
                                Text(movie.title)
                                    .shadow(radius: 20)
                                    .font(.system(size: 29, weight: .semibold, design: .default))
                                    .foregroundColor(.white)
                                
                                Spacer()
                                HStack(alignment: .firstTextBaseline, spacing: 3) {
                                    Image(systemName: "star.fill")
                                        .symbolRenderingMode(.multicolor)
                                    Text("5")
                                        .foregroundColor(.white)
                                }
                                .font(.subheadline.weight(.medium))
                            }
                            Text("East NY")
                                .foregroundColor(.white)
                                .font(.callout.weight(.medium))
                            Text(movie.description)
                                .foregroundColor(.white)
                                .font(.callout)
                                .padding(.vertical)
                        }
                        .padding(.horizontal, 24)
                        .padding(.top, 12)
                        VStack(alignment: .leading, spacing: 15) {
                            Text("HIGHLIGHTS")
                            
                                .kerning(2.0)
                                .font(.system(size: 12, weight: .medium, design: .default))
                                .foregroundColor(.white)
                            ForEach(0..<3) { _ in // Replace with your data model here
                                HStack(spacing: 9) {
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.red)
                                        .frame(width: 20)
                                        .clipped()
                                    Text("Amazing!!")
                                    Spacer()
                                }
                                .foregroundColor(.white)
                                .font(.subheadline)
                            }
                        }
                        VStack(spacing: 14) {
                            HStack(spacing: 4) {
                                Text("$49")
                                    .foregroundColor(.white)
                                    .font(.headline)
                                Text("per person")
                                    .foregroundColor(.white)
                            }
                        .padding(.horizontal, 24)
                        Map(coordinateRegion: $region, annotationItems: [movie]) { movie in
                                    MapPin(coordinate: region.center,tint: .red)
//                                        MapMarker(coordinate: region.center,tint: .red)

                                }
                                .frame(height: 200)
                                .onAppear {
                                    setRegion()
                                }
                                
                                Spacer()
                       
                           
                            QRCodeView(data: qrCodeData)
                                        .frame(width: 100, height: 100).onAppear {
                                            qrCodeData = "\(movie.title)\n\(movie.genre)\n\(movie.description)"
                                        }

                            Button(action: {}){
                                NavigationLink(destination: ReservationView()) {
                                    Text("Reserve")
                                        .font(.title3.weight(.medium))
                                        .padding(.vertical, 12)
                                        .padding(.horizontal, 24)
                                        .background(.yellow)
                                        .foregroundColor(.white)
                                        .shadow(radius: 20)
                                        .mask {
                                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                        }
                                }
                                
                            }
                            
                            .padding(.vertical, 28)
                        }
                    } }
            }.ignoresSafeArea()
        }}
    
    private func setRegion() {
           let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(movie.adress) { placemarks, error in
               guard let placemark = placemarks?.first, let location = placemark.location else {
                   return
               }
               region = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
           }
       }
}


struct QRCodeView: View {
    let data: String
    
    var body: some View {
        let filter = CIFilter.qrCodeGenerator()
        let data = Data(self.data.utf8)
        filter.setValue(data, forKey: "inputMessage")
        let ciImage = filter.outputImage
        
        let context = CIContext()
        guard let cgImage = context.createCGImage(ciImage!, from: ciImage!.extent) else {
            fatalError("Failed to create CGImage from CIImage.")
        }
        let uiImage = UIImage(cgImage: cgImage)
        
        return Image(uiImage: uiImage)
            .interpolation(.none)
            .resizable()
            .scaledToFit()
    }
}


struct HotelDetail_Previews: PreviewProvider {
    static var previews: some View {
        HotelDetail(movie: Movie(_id: "", title: "tghteghteg", description: "dfgqstgqth", genre: "arfsdgqs", image: "", adress: "beb bhar"))
    }
}
