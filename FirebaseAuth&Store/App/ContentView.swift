//
//  ContentView.swift
//  FirebaseAuth&Store
//
//  Created by Pawan kumar Verma on 19/10/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm: AuthViewModel 
    var body: some View {
        Group{
            if vm.currentUser == nil {
                LoginView()
            } else {
                ProfileView()
            }
        }
        .environmentObject(vm)
        
    }
}

#Preview {
    ContentView()
}
