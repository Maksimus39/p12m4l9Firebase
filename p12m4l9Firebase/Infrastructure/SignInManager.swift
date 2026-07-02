import Foundation
import FirebaseAuth



class SignInManager {
    func signInWithEmailAndPassword(email: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            guard error != nil else {
                completion(.success(true))
                return
                }
            
            guard (result?.user) != nil else { return }
            completion(.success(true))
        }
    }
}
