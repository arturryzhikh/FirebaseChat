//
//  User.swift
//  FirebaseChat
//
//  Created by Artur Ryzhikh on 05.01.2022.
//

import Foundation
struct User {
    let uid: String
    let email: String
    let profileImageUrl: String
    var accountName: String {
        return email.replacingOccurrences(of: "@gmail.com", with: "")
    }
}
