//
//  ProfileView.swift
//  FirebaseAuth&Store
//
//  Created by Pawan kumar Verma on 19/10/25.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var vm: AuthViewModel
    
    var body: some View {
       
        if let user = vm.currentUser {
            
            List {
                Section {
                    HStack(spacing: 20) {
                        Text(user.initials)
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                            .frame(width: 70, height: 70)
                            .background(
                                Circle()
                                    .foregroundStyle(.gray)
                                
                            )
                        
                        // userDetails
                        VStack(alignment: .leading) {
                            Text(user.fullName)
                                .font(.headline)
                            Text(user.email )
                                .font(.subheadline)
                        }
                    }
                }
                
                Section("Accounts") {
                    Button {
                        vm.signOut()
                    } label: {
                        Label {
                            Text("Sign Out")
                                .font(.subheadline)
                                .foregroundStyle(.black)
                        } icon: {
                            Image(systemName: "arrow.left.circle.fill")
                                .foregroundStyle(.red)
                        }

                    }
                    
                    Button {
                        Task {
                            await vm.deletUser()
                        }
                    } label: {
                        Label {
                            Text("Delete A/C")
                                .font(.subheadline)
                                .foregroundStyle(.black)
                        } icon: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundStyle(.red)
                        }

                    }
                }
                
                
                
            }
            
            
            
            
        } else {
            
        }
        

        
        

    }
}

#Preview {
    ProfileView()
        .environmentObject(AuthViewModel())
}
