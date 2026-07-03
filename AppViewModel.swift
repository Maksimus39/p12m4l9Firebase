import SwiftUI
import FirebaseAuth
import Combine


class AppViewModel: ObservableObject {
    @Published var isVerify: Bool = false
    
    func sendVerify() {
        if let user = Auth.auth().currentUser {
            user.sendEmailVerification()
        }
    }
    
    
    init() {
        isVerify = Auth.auth().currentUser?.isEmailVerified ?? false
        print(Auth.auth().currentUser?.uid)
        // "FIMR7x5SXWMhZ9hjEsheAk33iUF2"
    }
}
