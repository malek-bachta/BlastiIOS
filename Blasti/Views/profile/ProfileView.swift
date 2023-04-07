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
    @State private var colors = [Color.black, Color.yellow]

    var body: some View {
        NavigationView {
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .animation(Animation.linear(duration: 6.0).repeatForever(autoreverses: true))
                    .ignoresSafeArea()
                
                RoundedRectangle(cornerRadius: 100)
                    .fill(Color.white)
                                   .shadow(radius: 80)
                                   .offset(x:0,y:170)
                
                
            Button(action: {
                       // handle button tap
                   }) {
                       Image( systemName: "camera.circle.fill")
                
                           .foregroundColor(Color.white)
                           .frame(width: 20, height: 20)
                           .font(.system(size: 30))
                           .offset(x: 65, y:-280)
                       
                          
                   }
                Button(action: {
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
                 Spacer()
                
         
                
                Button(action: {
                           // handle button tap
                       }) {
                           Image( systemName: "house")
                           
                               .foregroundColor(Color.white)
                               .font(.system(size: 25))
                               .offset(x: -165, y:-385)
                               .shadow(radius: 300)
                       }
                
                Button(action: {
                    // handle button tap
                }) {
                    //NavigationLink(destination: EditProfileView()) { 
                        Image(systemName: "gear")
                            .foregroundColor(Color.white)
                            .font(.system(size: 28))
                            .offset(x: 165, y: -385)
                            .shadow(radius: 300)
                    //}
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
                            .listRowBackground(Color.yellow.opacity(0.7))
                            .foregroundColor(Color.black)
                            .font(.system(size: 20, design: .rounded).weight(.bold))

                        Section(header: Text("Reservations")    .foregroundColor(.black)){
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
                        }                            .listRowBackground(Color.yellow.opacity(0.7))
                        .foregroundColor(Color.black)
                        .font(.system(size: 20, design: .rounded).weight(.bold))
                            
                        
                    }
                    .listStyle(.inset)
                    .frame(width: 395, height: 700)
                    .offset(x: 0, y: 240)
                    .cornerRadius(10)
                   

                    Spacer()
                }

                HStack {
                    Text("User Name")
                        .foregroundColor(.white)
                        .shadow(radius: 100)
                        .offset(x: 0, y: -325)
                        .font(.system(size: 30, design: .rounded).weight(.semibold))
                        
                }
                Image("profilemain")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                    .offset(x: 0, y: -220)
                    .padding()
                    .foregroundColor(.black)
                   
                }
            }
        }
    }


struct Profil_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
