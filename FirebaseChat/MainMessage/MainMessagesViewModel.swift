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
    
    private let firebaseManager: FireBaseManaging
    init(firebaseManager: FireBaseManaging = FireBaseManager()) {
        self.firebaseManager = firebaseManager
        fetchCurrentUser()
    }
    
    private func fetchCurrentUser() {
        guard let uid = firebaseManager.auth.currentUser?.uid else  {
            errorMessage = "Could not find users id"
            return
        }
        firebaseManager.firestore.collection("users")
            .document(uid).getDocument { snapshot, error in
                if let error = error {
                    self.errorMessage = "Failed to fetch current user document \(error)"
                    return
                }
                guard let data = snapshot?.data() else {
                    self.errorMessage = "No data found for user : \(uid)"
                    return
                }
                let uid = data["uid"] as? String ?? ""
                let email = data["email"] as? String ?? ""
                let imageUrl = data ["profileImageUrl"] as? String ?? ""
                self.user = User(uid: uid, email: email, profileImageUrl: imageUrl)
                
            }
    }
}
