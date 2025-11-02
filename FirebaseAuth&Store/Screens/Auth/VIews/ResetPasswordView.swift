//
//  ResetPasswordView.swift
//  FirebaseAuth&Store
//
//  Created by Pawan kumar Verma on 02/11/25.
//

import SwiftUI

struct ResetPasswordView: View {
    @EnvironmentObject var vm: AuthViewModel
    @EnvironmentObject var router: Router
    
    @State private var email: String = ""
   
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Reset Password")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Enter the email associated with your account & we will send an email with instruction to reset it")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }
            .padding(.bottom, 20)
            
            InputView(placholder: "Enter your email", text: $email)
                .padding(.bottom, 16)
            
            Button {
                Task {
                    await vm.resetPassword(email)
                    if !vm.isError {
                        router.navigate(to: .emailSent)
                    }
                }
            } label: {
                Text("Send Instruction")
                    .font(.headline)
            }
            .buttonStyle(CapsuleButtonStyle())

            Spacer()
            
                .toolbarRole(.editor) 
        }
        .padding(16)
        
        
    }
}

#Preview {
        ResetPasswordView()
}
