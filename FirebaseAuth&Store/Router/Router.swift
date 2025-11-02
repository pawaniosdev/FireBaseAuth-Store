//
//  Router.swift
//  FirebaseAuth&Store
//
//  Created by Pawan kumar Verma on 03/11/25.
//

import Foundation
import SwiftUI

final class Router: ObservableObject {
    @Published var navPath = NavigationPath()
    
    enum AuthFlow: Hashable, Codable {
        case createAccount
        case emailSent
        case login
        case profile
        case resetPassword
    }
    
    func navigate(to destination: AuthFlow) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
    
}
