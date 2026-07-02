import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ContentViewModel = ContentViewModel()
    @EnvironmentObject var mainVM: MainViewModel
    
    var body: some View {
        VStack {
            TextField("email", text: $viewModel.email)
            TextField("password", text: $viewModel.password)
            
            Button {
                viewModel.createUser()
            } label: {
                Text("Registration")
            }

        }
        .onChange(of: viewModel.isRegist) { _ , newValue in
            if newValue {
                mainVM.selectedPage = .app
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
