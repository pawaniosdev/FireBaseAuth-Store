//
//  CreateAccountView.swift
//  FirebaseAuth&Store
//
//  Created by Pawan kumar Verma on 18/10/25.
//

import SwiftUI

struct CreateAccountView: View {
    @State private var email: String = ""
    @State private var fullName: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    @State private var isPasswordValid: Bool = false
    @EnvironmentObject var vm: AuthViewModel
    
    
    var isValidPassword: Bool {
        password == confirmPassword
    }
    
    
    
    var body: some View {
        VStack(spacing: 16) {
            // text
            Text("Please Complete all Information to create account".capitalized)
                .font(.headline)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
            
            Spacer()
                .frame(height: 20)
            
            InputView(placholder: "Email or Phone Number", text: $email)
                
            InputView(placholder: "FullName", text: $fullName)
            
            InputView(placholder: "Password", isSecureField: true, text: $password)
            
            ZStack {
                InputView(placholder: "Confirm Password", isSecureField: true, text: $confirmPassword)
                HStack {
                    Spacer()
                    if confirmPassword.count > 2 && password.count > 2 {
                        Image(systemName:  "\(isValidPassword ? "checkmark": "xmark").circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(!isValidPassword ? .red: .green)
                    }
                }
            }
            
            
            // button Create Account
            
            Spacer()
            Button {
                Task {
                    await vm.createUser(
                        email,
                        fullName,
                        password
                    )
                }
            } label: {
                Text("Create Account")
            }
            .buttonStyle(CapsuleButtonStyle())
            
            .toolbarRole(.editor)
        }
        .padding(.horizontal, 20)
    }
   
    
}

#Preview {
    CreateAccountView()
}
