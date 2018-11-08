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

class FirebaseModule {
    
    func createUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: <#T##String#>, password: <#T##String#>, completion: <#T##AuthDataResultCallback?##AuthDataResultCallback?##(AuthDataResult?, Error?) -> Void#>)
    }
}
