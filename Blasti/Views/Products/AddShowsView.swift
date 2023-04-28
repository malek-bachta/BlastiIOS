import SwiftUI
import PhotosUI
import UIKit
import CoreData

struct AddShowsView: View {
    // @StateObject var mm = ShowsViewModel()
    
    @Environment(\.presentationMode) private var presentationMode
    @State private var showTitle = ""
    /*************************************/
    @State var genre: String
    @State var name: String
     @State var duration: String
    @State var language: String
    @State var Production   : String
    @State var description: String
    
    /*******************************/
    @State private var showReleaseDate = ""
    @State private var selectedDate = Date()
    @State private var selectedLanguage: String = ""
    @State private var showCover: UIImage? = nil
    @State private var isImagePickerDisplayed = false
    @State private var showDuration: Double = 0
    
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
                        Text("Add Show")
                            .font(.system(size: 35, design: .rounded).weight(.bold))
                            .bold()
                            .foregroundColor(.white)
                            .padding(.bottom, 18)
                            .padding(.top, 80)
                        
                        //   mm.showInput(title: "Show Title", placeholder: "Enter Show Title", text: $mm.title)
                        
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Genre")
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            TextField("Enter Genre" , text: $genre)
                                .padding()
                                .background(Color.white.opacity(0.3))
                                .cornerRadius(8)
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Language")
                                .font(.headline)
                                .foregroundColor(.white)
                            
                              Picker(selection: $language, label:
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
                            
                            TextField("Enter Show Duration (minutes)" , value: $duration, formatter: numberFormatter )
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
                            
                            DatePicker("Enter Show Date", selection: $selectedDate, displayedComponents: .date)
                                .labelsHidden()
                                .accentColor(.white)
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Description")
                                .font(.headline)
                                .foregroundColor(.white)
                            TextField("Enter Show Description" , text: $description)
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
                            
                            TextField("Enter the writer and the director" , text: $Production)
                                .padding()
                                .background(Color.white.opacity(0.3))
                                .cornerRadius(8)
                        }
                        .padding(.horizontal)
                        
//                        VStack(alignment: .leading, spacing: 15) {
//                            Text("Image")
//                                .font(.headline)
//                                .foregroundColor(.white)
//
//                            if let showCover = showCover {
//                                Image(uiImage: showCover)
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
//                            ImagePicker(selectedImage: $showCover, isShown: $isImagePickerDisplayed)
//                        }
//
                        Button(action: {
                          /*  mm.addShow(title: mm.title, genre: mm.genre, description: mm.description)*/
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("Add Show")
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
            } .background(Image("splash")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill())
        }
        
    }
    
    struct SwiftUIView_Previews: PreviewProvider {
        static var previews: some View {
            AddShowsView(genre: "", name:"", duration: "", language: "", Production: "", description: "")
        }
    }
}

