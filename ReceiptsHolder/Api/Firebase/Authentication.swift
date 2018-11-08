//
//  Authentication.swift
//  ReceiptsHolder
//
//  Created by Jan Radzikowski on 08/11/2018.
//  Copyright © 2018 Jan Radzikowski. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import FirebaseAuth
import Firebase
class Authentication {
    let user = Variable<User?>(nil)
    
    init() {
        user.value = Auth.auth().currentUser
        Auth.auth().addStateDidChangeListener { [weak self] auth, user in
            self?.user.value = user
        }
    }
}
