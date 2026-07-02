import Foundation
import AuthenticationServices
import Combine


class ContentViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isRegist: Bool = false
    
    private let createUsermanager = RegistrationManager()
    
    func createUser() {
        createUsermanager.createUserFromEmailAndPassword(email: email, password: password) { result in
            switch result {
            case .success(let success):
                self.isRegist = success
            case .failure(let failure):
                print(failure)
            }
        }
    }
}


//private func isValid(_ type: FieldType, _ data: String) -> Bool {
//    var dataRegEX: String = ""
//    
//    switch type {
//    case .email:
//        dataRegEX = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$"
//    default:
//    dataRegEX = "(?=.*[A-Z0-9a-z].{6,})"
//    }
//    
//    let dataPredicate = NSPredicate(format: "SELF MATCHES %@", dataRegEX)
//    return dataPredicate.evaluate(with: data)
//}
