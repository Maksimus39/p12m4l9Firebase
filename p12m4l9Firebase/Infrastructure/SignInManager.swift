import Foundation
import FirebaseAuth



class SignInManager {
    func signInWithEmailAndPassword(email: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            guard error != nil else {
                completion(.success(true))
                return
                }
            
            guard let user = result?.user else { return }
            
            if user.isEmailVerified {
                completion(.success(true))
            } else {
                completion(.failure(NSError(domain: "Not verified", code: 0, userInfo: [NSLocalizedDescriptionKey: "Please verify your email"])))
            }
        }
    }
}
