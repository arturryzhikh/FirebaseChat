//
//  FirebaseManager.swift
//  FirebaseChat
//
//  Created by Artur Ryzhikh on 30.12.2021.
//

import Firebase

public protocol FireBaseManaging {
    var auth: Auth { get }
    var storage: Storage { get }
}


public final class FireBaseManager: FireBaseManaging {
    public let storage: Storage
    public let auth: Auth
    public init() {
        FirebaseApp.configure()
        self.auth = Auth.auth()
        self.storage = Storage.storage()
    }
}
