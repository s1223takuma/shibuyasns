//
//  AuthenticationManager.swift
//  testar
//
//  Created by 関琢磨 on 2024/12/09.
//

import Foundation
import FirebaseAuth


@Observable class AuthenticationManager {
    private(set) var isSignIn: Bool = false
    private var handle: AuthStateDidChangeListenerHandle!
    
    init() {
        // ここで認証状態の変化を監視する（リスナー）
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let _ = user {
                print("Sign-in")
                self.isSignIn = true
            } else {
                print("Sign-out")
                self.isSignIn = false
            }
        }
    }
    
    deinit {
        // ここで認証状態の変化の監視を解除する
        Auth.auth().removeStateDidChangeListener(handle)
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Error")
        }
    }
}
