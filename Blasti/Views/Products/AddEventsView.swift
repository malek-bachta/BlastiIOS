import SwiftUI
import PhotosUI
import UIKit
import CoreData

struct AddEventsView: View {
    // @StateObject var mm = EventsViewModel()
    
    @Environment(\.presentationMode) private var presentationMode
    @State private var eventTitle = ""
    /*************************************/
    @State var genre: String
    @State var name: String
     @State var duration: String
    @State var language: String
    @State var Production   : String
    @State var description: String
    
    /*******************************/
    @State private var eventReleaseDate = ""
    @State private var selectedDate = Date()
    @State private var selectedLanguage: String = ""
    @State private var eventCover: UIImage? = nil
    @State private var isImagePickerDisplayed = false
    @State private var eventDuration: Double = 0
    
    private var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.yellow,.black,.yellow.opacity(0.7),.black, .yellow]), startPoint: .top, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Add Event")
                            .font(.system(size: 35, design: .rounded).weight(.bold))
                            .bold()
                            .foregroundColor(.white)
                            .padding(.bottom, 18)
                        
                        //   mm.eventInput(title: "event Title", placeholder: "Enter event Title", text: $mm.title)
                        
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Music")
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            TextField("Enter Genre" , text: $genre)
                                .padding()
                                .background(Color.white.opacity(0.3))
                                .cornerRadius(8)
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Release")
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
                                Text("1st Release")
                                    .foregroundColor(.white)
                                    .tag("1st Release")
                                Text("2nd Release")
                                    .foregroundColor(.white)
                                    .tag("2nd Release")
                                Text("3rd Release")
                                    .foregroundColor(.white)
                                    .tag("3rd Release")
                            }
                            .pickerStyle(MenuPickerStyle())
                            .padding()
                            .frame(width: 160, height: 50)
                            .background(Color.white.opacity(0.3))
                            .cornerRadius(8)
                            
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Duration")
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            TextField("Enter event Duration (minutes)" , value: $duration, formatter: numberFormatter )
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
                            
                            DatePicker("Enter event Date", selection: $selectedDate, displayedComponents: .date)
                                .labelsHidden()
                                .accentColor(.white)
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Description")
                                .font(.headline)
                                .foregroundColor(.white)
                            TextField("Enter event Description" , text: $description)
                                .padding()
                                .frame(height: 100)
                                .background(Color.white.opacity(0.3))
                                .cornerRadius(8)
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Organization")
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            TextField("Enter the writer and the director" , text: $Production)
                                .padding()
                                .background(Color.white.opacity(0.3))
                                .cornerRadius(8)
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Image")
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            if let eventCover = eventCover {
                                Image(uiImage: eventCover)
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
                            ImagePicker(selectedImage: $eventCover, isShown: $isImagePickerDisplayed)
                        }
                        
                        Button(action: {
                          /*  mm.addevent(title: mm.title, genre: mm.genre, description: mm.description)*/
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("Add event")
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
    
    struct SwiftUIView_Previews: PreviewProvider {
        static var previews: some View {
            AddEventsView(genre: "", name:"", duration: "", language: "", Production: "", description: "")
        }
    }
}

