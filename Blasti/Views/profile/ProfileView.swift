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
    @State private var colors = [Color.yellow, Color.black]
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        NavigationView {
            ZStack {
                
                /*LinearGradient(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
                 .ignoresSafeArea()
                 
                 RoundedRectangle(cornerRadius: 100)
                 .fill(Color.white)
                 .shadow(radius: 80)
                 .offset(x:0,y:170)
                 */
                
                /* Button(action: {
                 // handle button tap
                 }) {
                 Image( systemName: "camera.circle.fill")
                 
                 .foregroundColor(Color.white)
                 .frame(width: 20, height: 20)
                 .font(.system(size: 30))
                 .offset(x: 65, y:-280)
                             }*/
           /* Button(action: {
                // handle button tap
            }) {
                Circle()
                
                    .scaledToFit()
                    .frame(width: 160)
                    .offset(x: 0, y: -220)
                    .padding()
                    .foregroundColor(.white)
                    .shadow(radius: 8)
            }
            Spacer()*/
            
            
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
                        NavigationLink(destination: SettignsView().navigationBarBackButtonHidden()) {
                            Label("", systemImage: "gear")
                                .font(.system(size: 30, design: .rounded).weight(.semibold))
                                .offset(x:-256,y:93)
                                .foregroundColor(.black)
                                .padding()
                        }
                    }
                }
                .padding(.top, 20)
                .padding(.horizontal, 10)
                
                Spacer()
            }
            
            VStack {
                Spacer()
                List {
                    Section(header: Text("Favorites")) {
                        Button(action: {
                            // Handle button action
                        }) {
                            Label("Movies", systemImage: "film")
                                .font(.system(size: 20, design: .rounded).weight(.light))
                            
                        }
                        Button(action: {
                            // Handle button action
                        }) {
                            Label("Shows", systemImage: "star.circle.fill")
                                .font(.system(size: 20, design: .rounded).weight(.light))
                        }
                        Button(action: {
                            // Handle button action
                        }) {
                            Label("Events", systemImage:"music.mic")
                                .font(.system(size: 20, design: .rounded).weight(.light))
                        }
                        // Add more favorite buttons as needed
                    }
                    //  .listRowBackground(Color.yellow.opacity(0.7))
                    //.foregroundColor(Color.black)
                    .font(.system(size: 20, design: .rounded).weight(.bold))
                    
                    Section(header: Text("Reservations")    //.foregroundColor(.black)
                    ){
                        Button(action: {
                            // Handle button action
                        }) {
                            Label("Movies", systemImage: "film")
                                .font(.system(size: 20, design: .rounded).weight(.light))
                        }
                        Button(action: {
                            // Handle button action
                        }) {
                            Label("Shows", systemImage: "star.circle.fill")
                                .font(.system(size: 20, design: .rounded).weight(.light))
                        }
                        Button(action: {
                            // Handle button action
                        }) {
                            Label("Events", systemImage:"music.mic")
                                .font(.system(size: 20, design: .rounded).weight(.light))
                        }
                        // Add more reservation buttons as needed
                    }                          //.listRowBackground(Color.yellow.opacity(0.7))
                    //     .foregroundColor(Color.black)
                    .font(.system(size: 20, design: .rounded).weight(.bold))
                    
                }
                .listStyle(.inset)
                .frame(width: 395, height: 750)
                .offset(x: 0, y: 280)
                .cornerRadius(10)
             //   .shadow(radius: 8)
                
                Button(action: {}) {
                    NavigationLink(destination: AddMoviesView()) {
                        HStack {
                            Text("GO PREMIUM")
                                .font(.system(size: 20, design: .rounded).weight(.semibold))
                                .foregroundColor(.white)
                            
                            Image(systemName: "star.fill")
                                .font(.system(size: 20, design: .rounded).weight(.semibold))
                                .foregroundColor(.white)
                        }
                        .frame(width: 200, height: 50)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.yellow.opacity(0.3)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                        .cornerRadius(10)
                        .shadow(radius: 10)
                    }
                }
                .offset(y: -60) // Move the button up a little
                
                
                
            }
         
            HStack {
                Text("User Name")
                    .foregroundColor(.white)
                    .shadow(radius: 100)
                    .offset(x: 110, y: -355)
                    .font(.system(size: 30, design: .rounded).weight(.semibold))
                
                
                
            }
                Circle()
                    .scaledToFit()
                    .frame(width: 160)
                    .offset(x: 110, y: -250)
                    .shadow(radius: 100)
                    .foregroundColor(.white)
                
            Image("profilemain")
                .resizable()
                .scaledToFit()
                .frame(width: 300)
                .offset(x: 110, y: -250)
                .padding()
                .shadow(radius: 100)
                .foregroundColor(.black)
            
        }
        .background(Image("bg")
            .resizable()
            .frame(width: 400, height: 800)
            .offset(x:0,y:-40))
            
            //.ignoresSafeArea(.all)
            
    }
}
}



struct Profil_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
