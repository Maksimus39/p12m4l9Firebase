import SwiftUI
import FirebaseAuth


struct AppView: View {
    @EnvironmentObject var mainVM: MainViewModel
    @StateObject var vm = AppViewModel()
    
    var body: some View {
        VStack {
            if !vm.isVerify {
                Text("Введите почту")
                
                Button {
                    vm.sendVerify()
                } label: {
                    Text("Отправить письмо")
                }

            }
        }
        
        Button {
            try? Auth.auth().signOut()
            mainVM.selectedPage = .register
            
        } label: {
            Text("log out")
        }

        
        Text("AppView")
    }
}

#Preview {
    AppView()
}
