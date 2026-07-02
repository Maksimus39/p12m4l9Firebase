import SwiftUI
import Combine


class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isOK: Bool = false
    
    private var signInManager = SignInManager()
    
    func signIn() {
        signInManager.signInWithEmailAndPassword(email: email, password: password) { result in
            switch result {
            case .success(let success):
                self.isOK = success
            case .failure(let failure):
                print(failure)
            }
        }
    }
}



struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    @EnvironmentObject var mainVM: MainViewModel
    
    
    var body: some View {
        TextField("email", text: $viewModel.email)
        SecureField("password", text: $viewModel.password)
        
        Button {
            viewModel.signIn()
        } label: {
            Text("Registration")
        }
        .onChange(of: viewModel.isOK) { oldvalue, newValue in
            if newValue {
                mainVM.selectedPage = .app
            }
        }
    }
}

#Preview {
    LoginView()
}
