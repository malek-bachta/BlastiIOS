////
////  QRGenView.swift
////  Blasti
////
////  Created by fullme on 4/5/2023.
////
//import CoreImage.CIFilterBuiltins
//import MessageUI
//import SwiftUI
//
//struct TicketView: View {
//    let ticket: Ticket
//
//    var body: some View {
//        VStack {
//            Text("Name: \(ticket.name)")
//            Text("Date: \(ticket.date, formatter: dateFormatter)")
//            Text("Time: \(ticket.time, formatter: timeFormatter)")
//            Text("Ticket Number: \(ticket.ticketNumber)")
//            Image(uiImage: ticket.qrCode)
//                .interpolation(.none)
//                .resizable()
//                .scaledToFit()
//        }
//    }
//
//    private let dateFormatter: DateFormatter = {
//        let formatter = DateFormatter()
//        formatter.dateStyle = .medium
//        formatter.timeStyle = .none
//        return formatter
//    }()
//
//    private let timeFormatter: DateFormatter = {
//        let formatter = DateFormatter()
//        formatter.dateStyle = .none
//        formatter.timeStyle = .short
//        return formatter
//    }()
//}
//
//
//
//struct QRGenView_Previews: PreviewProvider {
//    static var previews: some View {
//        TicketView(ticket: Ticket.Type)
//    }
//}
