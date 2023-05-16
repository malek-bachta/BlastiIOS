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
                        Text("Add Event")
                            .font(.system(size: 35, design: .rounded).weight(.bold))
                            .bold()
                            .foregroundColor(Color("Color"))
                            .padding(.bottom, 18)
                            .padding(.top, 80)
                        
                        //   mm.eventInput(title: "event Title", placeholder: "Enter event Title", text: $mm.title)
                        
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Title")
                                .font(.headline)
                                .foregroundColor(Color("rev"))
                            
                            TextField("Enter Title" , text: $em.title)
                                .padding()
                                .background(Color("rev").opacity(0.3))
                                .cornerRadius(8)
                            
                            Text("Event Type")
                                .font(.headline)
                                .foregroundColor(Color("rev"))
                            
                            TextField("Enter Type" , text: $em.type)
                                .padding()
                                .background(Color("rev").opacity(0.3))
                                .cornerRadius(8)
                            Text("Adress")
                                .font(.headline)
                                .foregroundColor(Color("rev"))
                            
                            TextField("Enter Adress" , text: $em.adress)
                                .padding()
                                .background(Color("rev").opacity(0.3))
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
                            .background(Color("rev").opacity(0.3))
                            .cornerRadius(8)
                            
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Price")
                                .font(.headline)
                                .foregroundColor(Color("rev"))
                            
                            TextField("Enter event Duration (minutes)" , value: $duration, formatter: numberFormatter )
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
                            
                            DatePicker("Enter event Date", selection: $selectedDate, displayedComponents: .date)
                                .labelsHidden()
                                .accentColor(Color("y"))
                                .foregroundColor(Color("rev"))
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Description")
                                .font(.headline)
                                .foregroundColor(Color("rev"))
                            TextField("Enter event Description" , text: $description)
                                .padding()
                                .frame(height: 100)
                                .background(Color("rev").opacity(0.3))
                                .cornerRadius(8)
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Organization")
                                .font(.headline)
                                .foregroundColor(Color("rev"))
                            
                            TextField("Enter the writer and the director" , text: $Production)
                                .padding()
                                .background(Color("rev").opacity(0.3))
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
                                    ImagePicker(image: self.$em.image, sourceType: self.sourceType)
                                }
                            }
                        }
                        .padding(.horizontal)
                        
                        }
                        
                        Button(action: {
                            em.addEvent(title: em.title, adress: em.adress, type: em.type, image: em.image)
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
            } .background(Image("splash")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill())
        }
        
    }
    
    struct SwiftUIView_Previews: PreviewProvider {
        static var previews: some View {
            AddEventsView(genre: "", name:"", duration: "", language: "", Production: "", description: "")
        }
    }


