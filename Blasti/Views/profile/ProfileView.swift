
import SwiftUI

struct Profil: View {
    
        
        @State var UserName: String = "siwar"
        @State var email: String = ""
        @State var phone: String = ""
        @State private var avatarImage: Image?
        @State var shouldShowImagePicker = false
        @State var image: UIImage?
        @State private var isPresentingConfirm: Bool = false
        @State private var isPresentingAlert: Bool = false

        
var body: some View {
    NavigationView{
        ZStack {
            Color.black
                .ignoresSafeArea()
            Circle()
                .fill(Color.yellow.opacity(0.18))
                .frame(width: 300, height: 300)
                .offset(x: -190, y: -100)
            Circle()
                .fill(Color.yellow.opacity(0.15))
                .frame(width: 350, height: 350)
                .offset(x: 250, y: -200)
            Circle()
                .fill(Color.yellow.opacity(0.15))
                .frame(width: 150, height: 500)
                .offset(x: -100, y: -390)
            Circle()
                .fill(Color.yellow.opacity(0.2))
                .frame(width: 150, height: 500)
                .offset(x: 180, y: 250)
            Circle()
                .fill(Color.yellow.opacity(0.1))
                .frame(width: 400, height: 400)
                .offset(x: -120, y: 320)
           Rectangle()
                .fill(Color.white.opacity(0.1))
                .frame(width: 320, height: 380)
                .cornerRadius(10)
                .offset(x:0, y: 120)
            

            
            VStack(alignment: .center){
                Spacer()
                
                Image(systemName: "person.fill")
                    .font(.system(size: 150))
                    .padding(10)
                    .foregroundColor(.white)                    .overlay(Circle()
                        .stroke(Color.white, lineWidth: 3))
                
                
                Spacer()
                NavigationLink(
                    destination: Login(),
                    label: {
                        Text("Edit Profil")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color("PrimaryColor"))
                            .cornerRadius(30)
                            .frame(width: 500, height: 150)
                    })
                VStack(alignment: .leading){
                    HStack{
                        Text("UserName :")
                            .padding()
                            .foregroundColor(.white)
                        Text("siwar")
                            .foregroundColor(.white)
                    }
                    
                    HStack{
                        Text("Email :" )
                            .padding()
                            .foregroundColor(.white)
                        Text("email@eamail.com")
                    }
                    HStack{
                        Text("Phone :")
                            .padding()
                            .foregroundColor(.white)
                        Text("123456789")
                            .foregroundColor(.white)
                    }
                }.offset(x:-50)
                
                Spacer()
            }
            
            
        }
    }
    //.padding(.top)
   
}
        
      
    }
struct Profil_Previews: PreviewProvider {
    static var previews: some View {
        Profil()
    }
}
