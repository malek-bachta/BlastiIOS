//
//  HomeView.swift
//  Babylo
//
//  Created by Babylo  on 6/4/2023.
//

import SwiftUI

struct Reservation : Identifiable{
    let id = UUID()
    let name: String
    let isAccepted: String

}

struct MyReservationsView: View {
    let reservations = [
        Reservation(name: "Movie Wakanda", isAccepted: "Declined"),
        Reservation(name: "Abdelli Show",  isAccepted: "Accepted"),
        Reservation(name: "Gravity Comm",  isAccepted: "Loading.."),
        Reservation(name: "Movie Avatar 2",  isAccepted: "Declined"),
        Reservation(name: "Birdhouse Event Dj Groove Music",  isAccepted: "Declined"),
        Reservation(name: "Interstellar",  isAccepted: "Loading.."),
        Reservation(name: "qqqqqq+",  isAccepted: "Event Cancelled"),
    ]
    func getColor(for status: String) -> Color {
                    switch status {
                    case "Accepted":
                        return .green
                    case "Declined":
                        return .red
                    case "Loading..":
                        return .orange
                    default:
                        return .gray
                    }
                }

    var body: some View {
        NavigationView {
            ZStack {
//                Color.black.edgesIgnoringSafeArea(.all)
        
                
                VStack {
                   
                 List(reservations) {
                     reservation in
                 VStack(alignment: .leading) {
                     Text(reservation.name)
                         .font(.system(size: 20, design: .rounded).weight(.semibold))
                         .foregroundColor(Color("rev"))
                     Text(reservation.isAccepted )
                         .padding(.leading,30)
                         .font(.system(size: 20, design: .rounded).weight(.light))
                     
                         .foregroundColor(getColor(for: reservation.isAccepted))
                
                     } .listRowSeparatorTint(Color("rev"))
                         .listRowBackground(getColor(for: reservation.isAccepted).opacity(0.2))
                 }
                
            
             }
             .listStyle(.plain)
             .background(Image("splash"))
             .navigationTitle("Reservations")
            
//             LinearGradient(gradient: Gradient(colors: [Color.white, Color.gray]), startPoint: .top, endPoint: .bottom)
//
//                 .edgesIgnoringSafeArea(.all)
            } .background(Image("splash"))
     }
 }
    }


struct MyReservationsView_Previews: PreviewProvider {
 static var previews: some View {
     MyReservationsView()
 }
}
