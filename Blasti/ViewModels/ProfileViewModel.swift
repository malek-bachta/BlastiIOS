import SwiftUI
import Combine

class ProfileViewModel: ObservableObject {
    @Published var pro:String?
    @Published var user = LogedInUser()
    private let networkService = NetworkService()

    init() {
        user = getuser() ?? LogedInUser()
        
    }
    
    func logout() {
        print("Logging out user...")
        
        self.removeuser()
        user = LogedInUser()
        UserDefaults.standard.set(false, forKey: "RememberMe")
        
        print("User logged out successfully.")
    }
    
    func removeuser() {
        print("Removing user data from UserDefaults...")
        
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "user")
        
        print("User data removed successfully.")
    }
    
    func getuser() -> LogedInUser? {
        let defaults = UserDefaults.standard
        
        if let savedUser = defaults.object(forKey: "user") as? Data {
            let decoder = JSONDecoder()
            
            if let loadedUser = try? decoder.decode(LogedInUser.self, from: savedUser) {
                return loadedUser
            }
        }
        
        return nil
    }
    
    
   
//    func sendAdminRoleRequest(adminEmail: String) {
//        networkService.sendAdminRoleRequest(adminEmail: adminEmail, onSuccess: {
//            DispatchQueue.main.async {
//                // handle success
//                print("Admin role request sent")
//            }
//        }, onFailure: { (title, message) in
//            DispatchQueue.main.async {
//                // handle failure
//                print("Error sending admin role request: \(message)")
//            }
//        })
//    }
    func saveuser(user:LogedInUser){
        let defaults = UserDefaults.standard
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(user) {
            defaults.set(encoded, forKey: "user")
        }
    }
    
    
    func sendAdminRoleInvitation(email: String) {
        networkService.sendAdminRoleInvitation(email: email, onSuccess: { u in
            self.saveuser(user: u )

        }, onFailure: { error in
            print("Error sending admin role request: \(error)")
        })
        user = getuser()!
    }
    
    












    







}
