//
//  FirebaseManager.swift
//  FirebaseChat
//
//  Created by Artur Ryzhikh on 30.12.2021.
//

import Firebase

public protocol FireBaseManaging {
    var auth: Auth { get }
}


public final class FireBaseManager: FireBaseManaging {
    let auth: Auth
    init() {
        FirebaseApp.configure()
        self.auth = Auth.auth()
    }
}
