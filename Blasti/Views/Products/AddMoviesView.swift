//
//  AddMoviesView.swift
//  Blasti
//
//  Created by Apple Esprit on 13/4/2023.
//

import SwiftUI
import PhotosUI
import UIKit
import CoreData

struct AddMoviesView: View {
    @StateObject var mm = MoviesViewModel()

    @Environment(\.presentationMode) private var presentationMode
    @State private var movieTitle = ""
    @State private var movieReleaseDate = ""
    @State private var selectedDate = Date()
    @State private var  selectedLanguage : String = ""
    @State private var movieCover: UIImage? = nil
     @State private var isImagePickerDisplayed = false
    @State private var movieDuration: Double = 0
    
       private var numberFormatter: NumberFormatter {
           let formatter = NumberFormatter()
           formatter.numberStyle = .decimal
           return formatter
       }

       var body: some View {
           NavigationView {
               ZStack {
                   LinearGradient(gradient: Gradient(colors: [.black, .gray]), startPoint: .top, endPoint: .bottom)
                       .ignoresSafeArea()
                   
                   ScrollView {
                       VStack(alignment: .leading, spacing: 20) {
                           Text("Add Movie")
                               .font(.system(size: 35, design: .rounded).weight(.bold))
                               .bold()
                               .foregroundColor(.white)
                               .padding(.bottom, 18)
                           
                           movieInput(title: "Movie Title", placeholder: "Enter Movie Title", text: $mm.title)
                           
                                                   

                           VStack(alignment: .leading, spacing: 15) {
                               
                               Text("Genre")
                                   .font(.headline)
                                   .foregroundColor(.yellow)
                               
                               TextField("Enter Movie Title", text: $mm.genre)
                                   .padding()
                                   .background(Color.white.opacity(0.3))
                                   .cornerRadius(8)
                           }
                           .padding(.horizontal)
                        
                           VStack(alignment: .leading, spacing: 15) {
                               
                               Text("Language")
                                   .font(.headline)
                                   .foregroundColor(.yellow)
                               
                               Picker(selection: $mm.language, label:
                                   HStack {
                                       Text("Select Language")
                                           .foregroundColor(.yellow)
                                       Spacer()
                                       Image(systemName: "chevron.down")
                                           .foregroundColor(.yellow)
                                   }
                               ) {
                                   Text("Arabic")
                                       .foregroundColor(.yellow)
                                       .tag("Arabic")
                                   Text("French")
                                       .foregroundColor(.yellow)
                                       .tag("French")
                                   Text("English")
                                       .foregroundColor(.yellow)
                                       .tag("English")
                               }
                               .pickerStyle(MenuPickerStyle())
                               .padding()
                               .frame(width: 140,height: 50)
                               .background(Color.white.opacity(0.3))
                               .cornerRadius(8)
                               
                           }

                           .padding(.horizontal)
                           
                           VStack(alignment: .leading, spacing: 15) {
                                      Text("Duration")
                                          .font(.headline)
                                          .foregroundColor(.yellow)
                                      
                               TextField("Enter Movie Duration (minutes)", value: $mm.duration, formatter: numberFormatter )
                                          .padding()
                                          .keyboardType(.numberPad)
                                          .background(Color.white.opacity(0.3))
                                          .frame(width: 140)
                                          .cornerRadius(8)
                                  }
                                  .padding(.horizontal)
                           
                           VStack(alignment: .leading, spacing: 15) {
                               Text("Date")
                                   .font(.headline)
                                   .foregroundColor(.yellow)
                               
                               DatePicker("Enter Movie Date", selection: $mm.date, displayedComponents: .date)
                                   .labelsHidden()
                                   .accentColor(.yellow)
                                   .foregroundColor(.yellow)
                           }
                           .padding(.horizontal)
                           
                           
                           VStack(alignment: .leading, spacing: 15) {
                              Text("Description")
                                   .font(.headline)
                                   .foregroundColor(.yellow)
                               
                               TextField("Enter Movie Desc", text: $mm.description)
                                   .padding()
                                   .frame(height: 100)
                                   .background(Color.white.opacity(0.3))
                                   .cornerRadius(8)
                           }
                           .padding(.horizontal)
                           
                           VStack(alignment: .leading, spacing: 15) {
                               Text("Production")
                                   .font(.headline)
                                   .foregroundColor(.yellow)
                               
                               TextField("Enter the writer and the director", text: $mm.Production)
                                   .padding()
                                   .background(Color.white.opacity(0.3))
                                   .cornerRadius(8)
                           }
                           .padding(.horizontal)
                           
                  // ********* IMAGE**********
                           VStack(alignment: .leading, spacing: 15) {
                                       Text("Image")
                                           .font(.headline)
                                           .foregroundColor(.yellow)
                                       
                                       if let movieCover = movieCover {
                                           Image(uiImage: movieCover)
                                               .resizable()
                                               .scaledToFit()
                                               .cornerRadius(8)
                                       } else {
                                           Button(action: {
                                               isImagePickerDisplayed.toggle()
                                           }) {
                                               Text("Pick the Cover")
                                                   .padding()
                                                   .background(Color.white.opacity(0.3))
                                                   .cornerRadius(8)
                                           }
                                       }
                                   }
                                   .padding(.horizontal)
                                   .sheet(isPresented: $isImagePickerDisplayed) {
                                       ImagePicker(selectedImage: $movieCover, isShown: $isImagePickerDisplayed)
                                   }
                           
                                                   // ************************
                           
                           Button(action: {
                               mm.addMovie(title: mm.title, date: mm.date, genre: mm.genre, description: mm.description, duration: mm.duration, Production: mm.Production, language: mm.language, image: mm.image)
                               presentationMode.wrappedValue.dismiss()
                           }) {
                               Text("Add Movie")
                                   .fontWeight(.bold)
                                   .foregroundColor(.black)
                                   .padding()
                                   .frame(maxWidth: .infinity)
                                   .background(Color.yellow)
                                   .cornerRadius(8)
                           }
                           .padding(.horizontal)
                       }
                       .padding(.horizontal)
                   }
                   .navigationBarItems(leading: Button(action: {
                       presentationMode.wrappedValue.dismiss()
                   }) {
                       Text("Cancel")
                           .foregroundColor(.yellow)
                   })
               }
           }
       }
       
       fileprivate func movieInput(title: String, placeholder: String, text: Binding<String>) -> some View {
           VStack(alignment: .leading, spacing: 15) {
               Text(title)
                   .font(.headline)
                   .foregroundColor(.yellow)
               
               TextField(placeholder, text: text)
                   .padding()
                   .background(Color.white.opacity(0.3))
                   .cornerRadius(8)
                   .foregroundColor(.white)
           }
           .padding(.horizontal)
       }
   
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        AddMoviesView()
    }
}
