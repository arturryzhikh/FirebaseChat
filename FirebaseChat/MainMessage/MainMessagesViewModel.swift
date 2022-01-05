//
//  MainMessagesViewModel.swift
//  FirebaseChat
//
//  Created by Artur Ryzhikh on 05.01.2022.
//

import SwiftUI

public class MainMessagesViewModel: ObservableObject {
    
    @Published var errorMessage: String = ""
    @Published var user: User?
    @Published var isLoggedOut = false
    
    private let fbManager = FireBaseManager()
    //MARK: life cycle
    init() {
        DispatchQueue.main.async {
            self.isLoggedOut =  self.fbManager.auth.currentUser?.uid == nil
        }
        
        fetchCurrentUser()
    }
    
    func handleSignOut() throws {
        isLoggedOut.toggle()
        try? fbManager.auth.signOut()
    }
    
    func fetchCurrentUser() {
        guard let uid = fbManager.auth.currentUser?.uid else  {
            errorMessage = "Could not find users id"
            return
        }
        fbManager.firestore.collection("users")
            .document(uid).getDocument { snapshot, error in
                if let error = error {
                    self.errorMessage = "Failed to fetch current user document \(error)"
                    return
                }
                guard let data = snapshot?.data() else {
                    self.errorMessage = "No data found for user : \(uid)"
                    return
                }
                
                self.user = User(data: data)
                
            }
    }
}
