import SwiftUI
import PhotosUI
import UIKit
import CoreData

struct AddEventsView: View {
     @StateObject var em = EventsViewModel()
    
    @Environment(\.presentationMode) private var presentationMode
    @State private var eventTitle = ""
    /*************************************/
    @State var genre = ""
    @State var name = ""
     @State var duration = ""
    @State var language = ""
    @State var Production = ""
    @State var description = ""
    
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
                LinearGradient(gradient: Gradient(colors: [.yellow,.black,.yellow.opacity(0.9),.black, .yellow]), startPoint: .top, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                Rectangle()
                    .fill(Color.black.opacity(0.5))
                                   .shadow(radius: 80)
                                   .frame(width: 400, height: 900)
                                   .ignoresSafeArea()
                
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Add Event")
                            .font(.system(size: 35, design: .rounded).weight(.bold))
                            .bold()
                            .foregroundColor(.white)
                            .padding(.bottom, 18)
                            .padding(.top, 80)
                        
                        //   mm.eventInput(title: "event Title", placeholder: "Enter event Title", text: $mm.title)
                        
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Title")
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            TextField("Enter Title" , text: $em.title)
                                .padding()
                                .background(Color.white.opacity(0.3))
                                .cornerRadius(8)
                            
                            Text("Event Type")
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            TextField("Enter Type" , text: $em.type)
                                .padding()
                                .background(Color.white.opacity(0.3))
                                .cornerRadius(8)
                            Text("Adress")
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            TextField("Enter Adress" , text: $em.adress)
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
                            Text("Price")
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
                        
//                        VStack(alignment: .leading, spacing: 15) {
//                            Text("Image")
//                                .font(.headline)
//                                .foregroundColor(.white)
//                            
//                            if let eventCover = eventCover {
//                                Image(uiImage: eventCover)
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
//                            ImagePicker(selectedImage: $eventCover, isShown: $isImagePickerDisplayed)
//                        }
//                        
                        Button(action: {
                            em.addEvent(title: em.title, adress: em.adress, type: em.type)
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("Add Event")
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
        }
        
    }
    
    struct SwiftUIView_Previews: PreviewProvider {
        static var previews: some View {
            AddEventsView(genre: "", name:"", duration: "", language: "", Production: "", description: "")
        }
    }
}

