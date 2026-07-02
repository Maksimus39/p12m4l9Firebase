import Foundation
import FirebaseAuth



class RegistrationManager {
    func createUserFromEmailAndPassword(email: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            
            
            guard let user = result?.user else { return }
            user.sendEmailVerification()
            
            completion(.success(true))
        }
    }
}


