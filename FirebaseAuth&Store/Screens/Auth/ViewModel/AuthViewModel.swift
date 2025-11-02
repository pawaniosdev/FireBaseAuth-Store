//
//  LoginViewModel.swift
//  FirebaseAuth&Store
//
//  Created by Pawan kumar Verma on 19/10/25.
//
import SwiftUI
import FirebaseAuth
import FirebaseFirestore

@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var isError: Bool = false
    @Published var currentUser: User? // Model
    
    private var auth = Auth.auth()  //authentication
    private let fireStore = Firestore.firestore()  // Store
   
    init() {
        Task {
//            await loadCurrentuser()
        }
    }
    func loadCurrentuser() async {
        if let user = auth.currentUser {
            userSession = user
            await fetchUser(by: user.uid)
        }
    }
    
    func loginUser(_ email: String, _ password: String) async {
        do {
            let loginResult = try await auth.signIn(withEmail: email, password: password)
        
                userSession = loginResult.user 
            await fetchUser(by: loginResult.user.uid)
            print(userSession?.email)
            print("Tying to login")
        } catch {
            isError = true
        }
    }
    
    func createUser(_ email: String, _ fullName: String, _ password: String) async {
        do {
            let result = try await auth.createUser(withEmail: email, password: password)
            await storeUserInFirestore(result.user.uid, email: email, fullName: fullName)
        } catch {
            isError = true
        }
    }
    
    
    /// this method save the users details in the fireStore since FireBase Auth can have only the id & Password.
    /// - Parameters:
    ///   - uid: this is the uid is get when the account is created successfully.
    func storeUserInFirestore(_ uid: String, email: String, fullName: String) async {
        let user = User(uid: uid, email: email, fullName: fullName)
        do {
            try await fireStore.collection("user").document(uid).setData(from: user)
        } catch {
            isError = true
        }
    }
    
    func fetchUser(by uid: String) async {
        do {
            print("fetching user details to login")
            print(uid)
            let document = try await  fireStore.collection("user").document(uid).getDocument()
            currentUser = try document.data(as: User.self)
        } catch {
            isError = true
        }
    }
    
    func signOut() {
        do {
            userSession = nil
            currentUser = nil
            try auth.signOut()
        } catch {
            isError = true 
        }
    }
     
    
    // delete user from the AuthStore
    func deletUser() async {
        userSession = nil
        currentUser = nil
        deleteUser(by: currentUser?.uid ?? "")
        try? await auth.currentUser?.delete()
    }
    
    
    // delete user form the fireStore.
    private func deleteUser(by uid: String)  {
         fireStore.collection("user").document(uid).delete()
    }
    
    
    func resetPassword(_ email: String) async {
        do {
            try await auth.sendPasswordReset(withEmail: email)
        } catch {
            isError = true
        }
    }
}
