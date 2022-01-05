//
//  NewMessageViewModel.swift
//  FirebaseChat
//
//  Created by Artur Ryzhikh on 05.01.2022.
//

import SwiftUI


public class NewMessageViewModel: ObservableObject {
    
    @Published var users: [User] = []
    @Published var statusMessage = ""
    private let fbManager: FireBaseManaging
    
    public init(fbManager: FireBaseManaging = FireBaseManager()) {
        self.fbManager = fbManager
        fetchUsers()
    }
    
    private func fetchUsers() {
        fbManager.firestore.collection("users")
            .getDocuments { snapshots, error in
                if let error = error {
                    self.statusMessage = "Failed to fetch users: \(error)"
                }
                self.statusMessage = "Successfully fetched users"
                guard let snapshots = snapshots else {
                    return
                }
                snapshots.documents.forEach { snapshot in
                    let data = snapshot.data()
                    let user = User(data: data)
                    if user.uid != self.fbManager.auth.currentUser?.uid {
                        self.users.append(user)
                    }
                    
                }
            }
    }
}
