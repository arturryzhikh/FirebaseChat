//
//  NewMessage.swift
//  FirebaseChat
//
//  Created by Artur Ryzhikh on 05.01.2022.
//

import SwiftUI

struct NewMessageView: View {
    
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(0..<10) { num in
                    Text("New user")
                    
                }.navigationTitle("New message")
                    .toolbar {
                        ToolbarItemGroup(placement: .navigationBarLeading) {
                            Button {
                                presentationMode.wrappedValue.dismiss()
                            } label: {
                                Text("Cancel")
                            }

                        }
                }
            }
        }
    }
}

struct NewMessage_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageView()
    }
}
