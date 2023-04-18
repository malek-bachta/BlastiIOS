import SwiftUI
import Combine

class ProfileViewModel: ObservableObject {
    @Published var pro:String?
    @Published var user = LogedInUser()
    
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

}
