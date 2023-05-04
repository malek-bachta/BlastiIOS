//
//  ReservationView.swift
//  Blasti
//
//  Created by Apple Esprit on 28/4/2023.
//
import SwiftUI

struct ReservationView: View {
    @State private var numberOfTickets: Int = 1
    @State private var selectedDate: Date = Date()
    @State private var showReservationView = false
//    let rv : Reservation
    
    var body: some View {
        ZStack{
            Image("bgres")
                .resizable()
                .ignoresSafeArea()
            //            Rectangle()
            //                .frame(width: 350, height: 700)
            //                .foregroundColor(Color("y").opacity(0.2))
            //                .cornerRadius(5)
            ScrollView(){
                VStack (){
                    Text("Reservation") .padding(.top, 50)
                    // .padding(.leading,50)
                        .font(.system(size: 35, design: .rounded).weight(.semibold))
                    Text("Number of Tickets")
                        .padding(.top, 50)
                    // .padding(.leading,50)
                        .font(.system(size: 25, design: .rounded).weight(.light))
                    Stepper(value: $numberOfTickets, in: 1...10) {
                        Text("\(numberOfTickets)")
                    }.frame(width: 200,height: 50)
                        .colorMultiply(.white)
                        .padding(.trailing,0)
                    
                    Text("Date")
                        .font(.system(size: 25, design: .rounded).weight(.light))
                    DatePicker(
                        selection: $selectedDate,
                        displayedComponents: [.date],
                        label: { Text("") }
                    ).frame(width: 200,height: 50)
                        .colorMultiply(.white)
                        .padding(.trailing,50)
                    
                    Spacer()
                  
                        }
                Button(action: {}) {
                    NavigationLink(destination: MyReservationsView()) {
                        HStack {
                            Text("Done")
                                .font(.system(size: 20, design: .rounded).weight(.semibold))
                                .foregroundColor(Color("AccentColor"))
                            
                            Image(systemName: "checkmark")
                                .font(.system(size: 20, design: .rounded).weight(.semibold))
                                .foregroundColor(Color("AccentColor"))
                        }
                        .frame(width: 150, height: 50)
//                            .offset(x:0,y:-50)
                        .background(                                  Color("y").opacity(0.8))
                        
                        .cornerRadius(10)
                        .shadow(radius: 10)
                    }
                    
                    
                }
                .padding()
             
                
                
            }
            .navigationBarTitle("Reservation")
        }
       
        
    }}

struct ReservationView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationView()
    }
}

