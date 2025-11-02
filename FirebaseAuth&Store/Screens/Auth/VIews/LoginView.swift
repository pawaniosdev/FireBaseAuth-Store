//
//  LoginView.swift
//  FirebaseAuth&Store
//
//  Created by Pawan kumar Verma on 18/10/25.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    @EnvironmentObject var router: Router
    @EnvironmentObject var vm: AuthViewModel
    
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            VStack(spacing: 16) {
                Image("deerLogo")
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 20)
                
                // title
                Text("lets connect with Us".capitalized)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Spacer().frame(height: 20 )
                // Textfields
                InputView(placholder: "Email or Phone number", text: $email)
                
                
                
                InputView(placholder: "Password", text: $password)
                
                // forgot button
                HStack {
                    Spacer()
                    
                    Button {
                        router.navigate(to: .resetPassword)
                    } label: {
                        Text("Forgot password?")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundStyle(.gray )
                    }
                    
                }
                
                
                
                // login Button
                
                Button {
                    Task {
                        await vm.loginUser(email, password)
                    }
                } label: {
                    Text(verbatim: "Login")
                }
                .buttonStyle(CapsuleButtonStyle())
                .padding(.bottom, 50)
                
                
                
                // Bottom divider
                HStack(spacing: 10) {
                    line
                    Text("or")
                        .font(.headline)
                        .foregroundStyle(.gray)
                    line
                }
                
                //appple
                
                Button {
                    
                } label: {
                    HStack {
                        Image(systemName: "apple.logo")
                            .frame(width: 15, height: 15)
                        Text("Sign up with apple")
                    }
                }
                .buttonStyle(CapsuleButtonStyle(bgColor: .black))
                
                
                // google
                Button {
                    
                } label: {
                    HStack {
                        Image("googleLogo")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text("Sign up with Google")
                    }
                }
                .buttonStyle(
                    CapsuleButtonStyle(
                        bgColor: .clear,
                        fontColor: .gray,
                        hasStroke: true
                    )
                )
                
                
                
                // footer
                
                Button {
                    router.navigate(to: .createAccount)
                } label: {
                    HStack {
                        Text("Don't have an account?")
                            .foregroundStyle(.black)
                        
                        Text("Sign Up")
                            .foregroundStyle(.teal)
                    }
                }
                
                
            }
            .padding(.horizontal)
            .ignoresSafeArea()
        }
        .alert("Something Went Wrong", isPresented: $vm.isError) {  }
    }
}

private var line: some View {
    VStack {
        Color.gray
    }
    .frame(height: 1)
    .frame(maxWidth: .infinity)
    
    
}

#Preview {
    LoginView()
        .environmentObject(AuthViewModel())
}





