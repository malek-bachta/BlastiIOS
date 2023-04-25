import SwiftUI

struct ProfileView: View {
    
    @State var UserName: String = "siwar"
    @State var email: String = ""
    @State var phone: String = ""
    @State private var avatarImage: Image?
    @State var shouldShowImagePicker = false
    @State var image: UIImage?
    @State private var isPresentingConfirm: Bool = false
    @State private var isPresentingAlert: Bool = false
    @State private var colors = [Color("y"), Color.black]
   
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                VStack {
                    HStack {
                        Button(action: {
                        }) {
                            
                            Label("", systemImage: "")
                                .font(.system(size: 40, design: .rounded).weight(.semibold))
                                .foregroundColor(.white)
                                .padding()
                        
                    }
                    Spacer()
                    
                    Button(action: {}) {
                        NavigationLink(destination: SettignsView()) {
                            Label("", systemImage: "gear")
                                .font(.system(size: 40, design: .default).weight(.semibold))
                                .offset(x: 15,y:20)
                                .foregroundColor(Color("AccentColor"))
                                
                        }
                    }
                }
              .padding(.top, 20)
                .padding(.horizontal, 10)
                
                Spacer()
            }
            
                VStack {
                    // Spacer()
                    List {
                        Section(header: Text("Favorites")) {
                            Button(action: {
                                // Handle button action
                            }) {
                                Label("Movies", systemImage: "film")
                                    .foregroundColor(Color("Color"))
                                    .font(.system(size: 20, design: .rounded).weight(.light))
                                
                            }
                            Button(action: {
                                // Handle button action
                            }) {
                                Label("Shows", systemImage: "star.circle.fill")
                                    .foregroundColor(Color("Color"))
                                    .font(.system(size: 20, design: .rounded).weight(.light))
                            }
                            Button(action: {
                                // Handle button action
                            }) {
                                Label("Events", systemImage:"music.mic")
                                    .foregroundColor(Color("Color"))
                                    .font(.system(size: 20, design: .rounded).weight(.light))
                            }
                            // Add more favorite buttons as needed
                        }
                        //  .listRowBackground(Color.Color("y").opacity(0.7))
                        //.foregroundColor(Color.black)
                        .font(.system(size: 20, design: .rounded).weight(.bold))
                        
                        Section(header: Text("Reservations")
                        ){
                            NavigationLink(destination: MovieTicket()) {
                                Label("Movies", systemImage: "film")
                                    .foregroundColor(Color("Color"))
                                    .font(.system(size: 20, design: .rounded).weight(.light))
                                
                            }
                            
                            NavigationLink(destination:  ShowTicket()) {
                            Label("Shows", systemImage: "star.circle.fill")
                                .foregroundColor(Color("Color"))
                                .font(.system(size: 20, design: .rounded).weight(.light))
                        }
                            NavigationLink(destination: EventTicket())  {
                            Label("Events", systemImage:"music.mic")
                                .foregroundColor(Color("Color"))
                                .font(.system(size: 20, design: .rounded).weight(.light))
                        }
                        // Add more reservation buttons as needed
                    }                          //.listRowBackground(Color.Color("y").opacity(0.7))
                    //     .foregroundColor(Color.black)
                    .font(.system(size: 20, design: .rounded).weight(.bold))
                    
                }
                .listStyle(.inset)
                .frame(width: 395, height: 750)
                .offset(x: 0, y: 280)
                .cornerRadius(10)
             //   .shadow(radius: 8)
                    HStack{
                        Button(action: {}) {
                            NavigationLink(destination: AddMoviesView()) {
                                HStack {
                                    Text("Add Movie")
                                        .font(.system(size: 20, design: .rounded).weight(.semibold))
                                        .foregroundColor(Color("AccentColor"))
                                    
                                    Image(systemName: "star.fill")
                                        .font(.system(size: 20, design: .rounded).weight(.semibold))
                                        .foregroundColor(Color("AccentColor"))
                                }
                                .frame(width: 150, height: 50)
                                .background(
                                    LinearGradient(gradient: Gradient(colors: [Color("color1").opacity(0.3),Color("y"), Color("color1").opacity(0.3)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                )
                                .cornerRadius(10)
                                .shadow(radius: 10)
                            }
                        }
                        Button(action: {}) {
                            NavigationLink(destination: AddEventsView()) {
                                HStack {
                                    Text("Add Event")
                                        .font(.system(size: 20, design: .rounded).weight(.semibold))
                                        .foregroundColor(Color("AccentColor"))
                                    
                                    Image(systemName: "star.fill")
                                        .font(.system(size: 20, design: .rounded).weight(.semibold))
                                        .foregroundColor(Color("AccentColor"))
                                }
                                .frame(width: 150, height: 50)
                                .background(
                                    LinearGradient(gradient: Gradient(colors: [Color("color1").opacity(0.3),Color("y"), Color("color1").opacity(0.3)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                )
                                .cornerRadius(10)
                                .shadow(radius: 10)
                            }
                        }
                    }
                .offset(y: -60) // Move the button up a little
                
                
                
            }
         
            HStack {
                Text("User Name")
                    .foregroundColor(Color("AccentColor"))
                    .shadow(radius: 100)
                    .offset(x: -110, y: -290)
                    .font(.system(size: 30, design: .rounded).weight(.thin ))
                
                
                
            }
                Circle()
                    .scaledToFit()
                    .frame(width: 125)
                    .offset(x: 55, y: -300)
                    .shadow(radius: 100)
                    .foregroundColor(Color("c"))
                    
                
            Image("profilemain")
                .resizable()
                .scaledToFit()
                .frame(width: 240)
                .offset(x: 55, y: -300)
                .padding()
                .shadow(radius: 100)
                
            
        }
        .background(Image("pbg")
            .resizable()
            .frame(width: 400, height: 800)
            .offset(x:0,y:-40))
            
//            .ignoresSafeArea(.all)
            
    }

}

}



struct Profil_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
