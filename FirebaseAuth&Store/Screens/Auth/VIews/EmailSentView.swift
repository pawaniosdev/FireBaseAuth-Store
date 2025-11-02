//
//  EmailSentView.swift
//  FirebaseAuth&Store
//
//  Created by Pawan kumar Verma on 02/11/25.
//

import SwiftUI

struct EmailSentView: View {
    
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "envelope.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .scaledToFit()
                .foregroundStyle(.teal)
            
            VStack(alignment: .center, spacing: 8) {
                
                Text("Check your email")
                    .font(.largeTitle.bold())
                
                Text("We have sent a password recover instruction to you email.")
                    .multilineTextAlignment(.center)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            
            .padding(.bottom, 20)
            
            Button {
                router.navigateToRoot()
            } label: {
                Text("Skip, I'll confirm later")
            }
            .buttonStyle(CapsuleButtonStyle())
            
            Spacer()
            
            Button {
                router.navigateBack()
            } label: {
                    (
                        Text("Didn't receive the email? Check you spam filter, or ").foregroundStyle(.gray) +
                        Text("try another email address")
                            .foregroundStyle(.teal)
                    )
                }
            
            
        }
    }
}

#Preview {
    EmailSentView()
        .padding()
}
