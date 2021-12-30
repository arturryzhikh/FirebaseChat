//
//  ContentView.swift
//  FirebaseChat
//
//  Created by Artur Ryzhikh on 30.12.2021.
//

import SwiftUI
import Firebase

struct LoginView: View {

    @State private var isLoginMode = false
    @State private var email = ""
    @State var password = ""
    @State private var accountStatusMessage = ""
    private let firebaseManager: FireBaseManaging
    init(firebaseManager: FireBaseManaging = FireBaseManager()) {
        self.firebaseManager = firebaseManager
    }
    var body: some View {
        NavigationView {
            
            ScrollView {
                VStack(spacing: 16) {
                    Picker(selection: $isLoginMode, label: Text("Picker here")) {
                        Text("Login")
                            .tag(true)
                        Text("Create Account")
                            .tag(false)
                    }.pickerStyle(SegmentedPickerStyle())

                    if !isLoginMode {
                        Button {

                        } label: {
                            Image(systemName: "person.fill")
                                .font(.system(size: 64))
                                .padding()
                        }
                    }

                    Group {
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                        SecureField("Password", text: $password)
                    }
                    .padding(12)
                    .background(Color.white)

                    Button {
                        handleAction()
                    } label: {
                        HStack {
                            Spacer()
                            Text(isLoginMode ? "Log In" : "Create Account")
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                                .font(.system(size: 14, weight: .semibold))
                            Spacer()
                        }.background(Color.blue)

                    }
                    
                    Text(accountStatusMessage)
                        .foregroundColor(.red)
                }
                .padding()

            }
            .navigationTitle(isLoginMode ? "Log In" : "Create Account")
            .background(Color(.init(white: 0, alpha: 0.05))
                            .ignoresSafeArea())
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
//MARK: Methods
    
    private func createNewAccount() {
        firebaseManager.auth.createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Error creating new user, Error:",error)
                accountStatusMessage = "Failed creating new user: \(error       )"
                return
            }
            print("Successfullly created user \(result?.user.uid ?? "")")
            accountStatusMessage = "Successfullly created user \(result?.user.uid ?? "")"
        }
    }
    
    private func loginUser() {
        firebaseManager.auth.signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                accountStatusMessage = "Failed to logint user: \(error)"
            }
            accountStatusMessage = "Successfullly logged in as user \(result?.user.uid ?? "")"
        }
    }
    
    private func handleAction() {
        isLoginMode ?  loginUser() : createNewAccount()
    }

    
}
struct ContentView_Previews1: PreviewProvider {
    static var previews: some View {
        LoginView()
            .ignoresSafeArea(.all)
    }
}
 

