import SwiftUI

struct TicketsView: View {
    
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
                    // Spacer()
                    List {
                     
                        
                        Section(header: Text("Your Tickets")
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
                    }                          .listRowBackground(Color("y").opacity(0.2))
                       .foregroundColor(Color("rev"))
                    .font(.system(size: 20, design: .rounded).weight(.bold))
                    
                }
                .listStyle(.inset)
                .frame(width: 395, height: 300)
                .offset(x: 0, y: 0)
                .cornerRadius(10)
             //   .shadow(radius: 8)
                                   
            }
         
    
        }
        .background(Image("bgtiket")
                    
            .resizable()
            .scaledToFill()
            .frame(width: 400, height: 800)
            .offset(x:0,y:-40))
        //.scaledToFit()
        
            
        //            .ignoresSafeArea(.all)
            
    }

}

}



struct TicketsView_Previews: PreviewProvider {
    static var previews: some View {
        TicketsView()
    }
}
