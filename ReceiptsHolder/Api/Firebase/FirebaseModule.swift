//
//  FirebaseModule.swift
//  ReceiptsHolder
//
//  Created by Jan Radzikowski on 08/11/2018.
//  Copyright © 2018 Jan Radzikowski. All rights reserved.
//

import Foundation
import Firebase
import RxSwift
import FirebaseAuth

class FirebaseModule {
    let auth = Authentication()
    let loginError = Variable<Error?>(nil)
    
    func createUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password, completion: { [weak self] user, error in
            print("USER_EVENT - FirebaseModule - createUser()")
        })
        
        
    }
    
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] user, error in
            print("USER_EVENT - FirebaseModule - signIn()")
            self?.auth.user.value = Auth.auth().currentUser
            self?.loginError.value = error
        }
    }
}
