//
//  LoginViewModel.swift
//  ReceiptsHolder
//
//  Created by Jan Radzikowski on 08/11/2018.
//  Copyright © 2018 Jan Radzikowski. All rights reserved.
//

import Foundation
import RxSwift
import Firebase
import FirebaseAuth

class LoginViewModel: GeneralModel {
    let bag = DisposeBag()
    let emailText = Variable<String>("")
    let passwordText = Variable<String>("")
    let user = Variable<User?>(nil)
    
    var isValid: Observable<Bool> {
        return Observable.combineLatest(emailText.asObservable(), passwordText.asObservable()) { email, password in
            email.isValidEmail() && String(password).count > 3
        }
    }
    
    override init() {
        super.init()
        _ = manager.firebase.auth.user
            .asObservable()
            .throttle(2, latest: false, scheduler: MainScheduler.instance)
            .subscribe { [unowned self] user in
                self.user.value = user.element ?? nil
            }.disposed(by: bag)
        
    }
    
    func login() {
        manager.firebase.signIn(email: emailText.value, password: passwordText.value)
    }
}
