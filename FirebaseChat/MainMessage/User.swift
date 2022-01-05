//
//  User.swift
//  FirebaseChat
//
//  Created by Artur Ryzhikh on 05.01.2022.
//

import Foundation

struct User: Identifiable {
    var id: String { uid }
    
    let uid: String
    let email: String
    let profileImageUrl: String
    var name: String {
        return email.replacingOccurrences(of: "@gmail.com", with: "")
    }
    init(data: [String: Any]) {
        self.uid = data["uid"] as? String ?? ""
        self.email = data["email"] as? String ?? ""
        self.profileImageUrl = data ["profileImageUrl"] as? String ?? ""
    }
}
