//
//  FirebaseChatApp.swift
//  FirebaseChat
//
//  Created by Artur Ryzhikh on 30.12.2021.
//

import SwiftUI
import Firebase
@main


struct FirebaseChatApp: App {
    
    
   var body: some Scene {
        WindowGroup {
            MainMessagesView()
           
        }
    }
   
    init() {
        FirebaseApp.configure()
    }
}
