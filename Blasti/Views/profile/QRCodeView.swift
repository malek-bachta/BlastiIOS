////
////  qr.swift
////  qrtest
////
////  Created by fullme on 4/5/2023.
////
//
//import Foundation
//import SwiftUI
//import PhotosUI
//
//import CoreData
//import CoreImage.CIFilterBuiltins
//
//struct QRCodeView:View {
//    let context = CIContext()
//    let filter = CIFilter.qrCodeGenerator()
//    var url : String
//
//    var body: some View {
//        Image(uiImage: generateQRCodeImage( url: <#T##String#>))
//            .interpolation(.none)
//            .resizable()
//    }
//    func generateQRCodeImage( url: String) -> UIImage {
//        let data = Data(url.utf8)
//        filter.setValue(data, forKey: "inputMessage")
//
//        if let qrCodeImage = filter.outputImage {
//            if let  qrCodeImage = context.createCGImage(qrCodeImage, from: qrCodeImage.extent){
//                return UIImage (cgImage: qrCodeCGImage)
//            }
//        }
//            return UIImage(systemName: "xmark") ?? UIImage()
//
//
//    }
//
//}
