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
    @State private var selectedLanguage: String = ""
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
                LinearGradient(gradient: Gradient(colors: [.yellow,.black,.yellow.opacity(0.9),.black, .yellow]), startPoint: .top, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                Rectangle()
                    .fill(Color.black.opacity(0.5))
                                   .shadow(radius: 80)
                                   .frame(width: 400, height: 900)
                                   .ignoresSafeArea()
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Add Movie")
                            .font(.system(size: 35, design: .rounded).weight(.bold))
                            .bold()
                            .foregroundColor(.white)
                            .padding(.bottom, 18)
                            .padding(.top, 80)
                        
                        mm.movieInput(title: "Movie Title", placeholder: "Enter Movie Title", text: $mm.title)
                        
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Genre")
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            TextField("Enter Genre", text: $mm.genre)
                                .padding()
                                .background(Color.white.opacity(0.3))
                                .cornerRadius(8)
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Language")
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            Picker(selection: $mm.language, label:
                                    HStack {
                                Text("Select Language")
                                    .foregroundColor(.white)
                                Spacer()
                                Image(systemName: "chevron.down")
                                    .foregroundColor(.white)
                            }
                            ) {
                                Text("Arabic")
                                    .foregroundColor(.white)
                                    .tag("Arabic")
                                Text("French")
                                    .foregroundColor(.white)
                                    .tag("French")
                                Text("English")
                                    .foregroundColor(.white)
                                    .tag("English")
                            }
                            .pickerStyle(MenuPickerStyle())
                            .padding()
                            .frame(width: 140, height: 50)
                            .background(Color.white.opacity(0.3))
                            .cornerRadius(8)
                            
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Duration")
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            TextField("Enter Movie Duration (minutes)", value: $mm.duration, formatter: numberFormatter)
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
                                .foregroundColor(.white)
                            
                            DatePicker("Enter Movie Date", selection: $selectedDate, displayedComponents: .date)
                                .labelsHidden()
                                .accentColor(.yellow)
                                .colorMultiply(.yellow)
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Description")
                                .font(.headline)
                                .foregroundColor(.white)
                            TextField("Enter Movie Description", text: $mm.description)
                                .padding()
                                .frame(height: 100)
                                .background(Color.white.opacity(0.3))
                                .cornerRadius(8)
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Production")
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            TextField("Enter the writer and the director", text: $mm.Production)
                                .padding()
                                .background(Color.white.opacity(0.3))
                                .cornerRadius(8)
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Image")
                                .font(.headline)
                                .foregroundColor(.white)
                            
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
                        
                        Button(action: {
                            mm.addMovie(title: mm.title, genre: mm.genre, description: mm.description)
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
                        .offset(x:0,y:-20)
                })
            }
        }
        
    }
    
    struct SwiftUIView_Previews: PreviewProvider {
        static var previews: some View {
            AddMoviesView()
        }
    }
}
