import SwiftUI
import FirebaseCore
import Combine
import FirebaseAuth

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

enum Page {
    case register, login, app
}

class MainViewModel: ObservableObject {
    @Published var selectedPage: Page = .register
    
    init() {
       if let user = Auth.auth().currentUser {
           selectedPage = .app
       } else {
           selectedPage = .register
       }
    }
}


@main
struct p12m4l9FirebaseApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var viewModel: MainViewModel = MainViewModel()
    
    
    var body: some Scene {
        WindowGroup {
            switch viewModel.selectedPage {
            case .register:
                ContentView()
                    .environmentObject(viewModel)
            case .login:
                LoginView()
            case .app:
                AppView()
            }
            
        }
    }
}
