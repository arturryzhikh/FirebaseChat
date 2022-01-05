//
//  FirebaseManager.swift
//  FirebaseChat
//
//  Created by Artur Ryzhikh on 30.12.2021.
//

import Firebase
import FirebaseFirestore


public protocol FireBaseManaging {
    var auth: Auth { get }
    var storage: Storage { get }
    var firestore: Firestore { get }
}


public final class FireBaseManager: FireBaseManaging {
    public let storage: Storage
    public let auth: Auth
    public let firestore: Firestore
    public init() {
        FirebaseApp.configure()
        self.auth = Auth.auth()
        self.storage = Storage.storage()
        self.firestore = Firestore.firestore()
    }
}
