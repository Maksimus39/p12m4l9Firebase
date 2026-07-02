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
        if let verify = Auth.auth().currentUser?.isEmailVerified {
            self.isVerify = isVerify
        } else {
            isVerify = false
        }
    }
}
