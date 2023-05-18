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
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    private var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Add Movie")
                            .font(.system(size: 35, design: .rounded).weight(.bold))
                            .bold()
                            .foregroundColor(Color("Color"))
                            .padding(.bottom, 18)
                            .padding(.top, 80)
                        VStack(alignment: .leading, spacing: 15) {
                                   Text("Title")
                                       .font(.headline)
                                       .foregroundColor(Color("rev"))
                       
                            TextField("placeholder", text: $mm.title)
                                       .padding()
                                       .background(Color("rev").opacity(0.3))
                                       .cornerRadius(8)
                                       .foregroundColor(.white)
                               }
                               .padding(.horizontal)
//                        mm.movieInput(title: "Movie Title", placeholder: "Enter Movie Title", text: $mm.title)
                        
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Genre")
                                .font(.headline)
                                .foregroundColor(Color("rev"))
                            
                            TextField("Enter Genre", text: $mm.genre)
                                .padding()
                                .background(Color("rev").opacity(0.3))
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
                            .background(Color("rev").opacity(0.3))
                            .cornerRadius(8)
                            
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Duration")
                                .font(.headline)
                                .foregroundColor(Color("rev"))
                            
                            TextField("Enter Movie Duration (minutes)", value: $mm.duration, formatter: numberFormatter)
                                .padding()
                                .keyboardType(.numberPad)
                                .background(Color("rev").opacity(0.3))
                                .frame(width: 140)
                                .cornerRadius(8)
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Date")
                                .font(.headline)
                                .foregroundColor(Color("rev"))
                            
                            DatePicker("Enter Movie Date", selection: $selectedDate, displayedComponents: .date)
                                .labelsHidden()
                                .accentColor(Color("y"))
                                .colorMultiply(Color("y"))
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Description")
                                .font(.headline)
                                .foregroundColor(Color("rev"))
                            TextField("Enter Movie Description", text: $mm.description)
                                .padding()
                                .frame(height: 100)
                                .background(Color("rev").opacity(0.3))
                                .cornerRadius(8)
                        }
                        .padding(.horizontal)
//
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Address")
                                .font(.headline)
                                .foregroundColor(Color("rev"))
                            
                            TextField("Enter adress", text: $mm.adress)
                                .padding()
                                .background(Color("rev").opacity(0.3))
                                .cornerRadius(8)
                        }
                        .padding(.horizontal)
                        
//                        VStack(alignment: .leading, spacing: 15) {
//                            Text("Production")
//                                .font(.headline)
//                                .foregroundColor(.white)
//
//                            TextField("Enter the writer and the director", text: $mm.Production)
//                                .padding()
//                                .background(Color.white.opacity(0.3))
//                                .cornerRadius(8)
//                        }
//                        .padding(.horizontal)
////
//                        VStack(alignment: .leading, spacing: 15) {
//                            Text("Image")
//                                .font(.headline)
//                                .foregroundColor(.white)
//
//                            if let movieCover = movieCover {
//                                Image(uiImage: movieCover)
//                                    .resizable()
//                                    .scaledToFit()
//                                    .cornerRadius(8)
//                            } else {
//                                Button(action: {
//                                    isImagePickerDisplayed.toggle()
//                                }) {
//                                    Text("Pick the Cover")
//                                        .padding()
//                                        .background(Color.white.opacity(0.3))
//                                        .cornerRadius(8)
//                                }
//                            }
//                        }
//                        .padding(.horizontal)
//                        .sheet(isPresented: $isImagePickerDisplayed) {
//                            ImagePicker(selectedImage: $movieCover, isShown: $isImagePickerDisplayed)
//                        }
////
                        VStack(alignment: .leading, spacing: 15){
                                        if let selectedImage = movieCover {
                                            Image(uiImage: selectedImage)
                                                .resizable()
                                                .scaledToFit()
                                                .clipShape(Circle())
                                                .padding()
                                        } else {
                                            Button(action: {
                                                PHPhotoLibrary.requestAuthorization(for: .readWrite) { status in
                                                    DispatchQueue.main.async {
                                                        switch status {
                                                        case .authorized:
                                                            self.isImagePickerDisplayed = true
                                                            break
                                                        case .denied, .restricted:
                                                            // Handle denied or restricted permission
                                                            break
                                                        case .notDetermined:
                                                            // Handle not determined permission
                                                            break
                                                        default:
                                                            break
                                                        }
                                                    }
                                                }
                                                // Code to be executed when the button is tapped
                                                print("Button tapped")
                                            }) {
                                                Image(systemName: "photo").resizable().frame(width: 30,height: 30)// Set the icon using an SF Symbol
                                                    .foregroundColor(.gray)
                                                Text("Photo").foregroundColor(Color.black)// Set the icon's color
                                            }
                                            .sheet(isPresented: $isImagePickerDisplayed) {
                                                ImagePicker(image: self.$mm.image, sourceType: self.sourceType)
                                            }
                                        }
                                    }

                        Button(action: {
                            mm.addMovie(title: mm.title, genre: mm.genre, description: mm.description,adress: mm.adress
                                        , image: mm.image
                            )
                            
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("Add Movie")
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color("y"))
                                .cornerRadius(8)
                        }
                        .padding(.horizontal)
                        
                    }
                    .padding(.horizontal)
                    Spacer()
                        .frame(height: 100)

                }
//                .navigationBarItems(leading: Button(action: {
//                    presentationMode.wrappedValue.dismiss()
//                }) {
//                    Text("Cancel")
//                        .foregroundColor(.yellow)
//                        .offset(x:0,y:-20)
//                })
            }
            .background(Image("splash")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill())        }
        
    }
    
    struct SwiftUIView_Previews: PreviewProvider {
        static var previews: some View {
            AddMoviesView()
        }
    }
}
