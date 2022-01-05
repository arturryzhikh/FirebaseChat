//
//  NewMessage.swift
//  FirebaseChat
//
//  Created by Artur Ryzhikh on 05.01.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewMessageView: View {
    
    @Environment(\.presentationMode) private var presentationMode
    @ObservedObject private var viewModel = NewMessageViewModel()
    var body: some View {
        NavigationView {
            ScrollView {
                Text(viewModel.statusMessage)
                ForEach(viewModel.users) { user in
                    Button {
                        
                    } label: {
                        HStack(spacing: 16) {
                            WebImage(url: URL(string: user.profileImageUrl))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .clipped()
                                .cornerRadius(50)
                                .overlay(RoundedRectangle(cornerRadius: 50)
                                            .stroke(Color(.label),
                                                    lineWidth: 1))
                            Text(user.name)
                                .foregroundColor(Color(.label))
                            Spacer()
                        }.padding(.horizontal)
                        Divider()
                            .padding(.vertical, 8)
                        
                    }
                    
                }
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

struct NewMessage_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageView()
    }
}
