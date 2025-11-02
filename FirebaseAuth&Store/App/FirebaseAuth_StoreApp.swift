//
//  FirebaseAuth_StoreApp.swift
//  FirebaseAuth&Store
//
//  Created by Pawan kumar Verma on 17/10/25.
//

import SwiftUI
import UIKit
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct FirebaseAuth_StoreApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var vm = AuthViewModel()
    @ObservedObject var router = Router()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navPath) {
                ContentView()
                    .navigationDestination(for: Router.AuthFlow.self) { destination in
                        switch destination {
                        case .login: LoginView()
                        case .createAccount: CreateAccountView()
                        case .emailSent: EmailSentView()
                        case .profile: ProfileView()
                        case .resetPassword: ResetPasswordView()
                            
                        }
                    }
            }
            .environmentObject(vm)
            .environmentObject(router)
        }
    }
}
