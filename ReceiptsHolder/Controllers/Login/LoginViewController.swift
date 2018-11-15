//
//  LoginViewController.swift
//  ReceiptsHolder
//
//  Created by Jan Radzikowski on 02/11/2018.
//  Copyright © 2018 Jan Radzikowski. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class LoginViewController: UIViewController {
    
    fileprivate let bag = DisposeBag()
    
    let loginViewModel = LoginViewModel()
    
    let keyboardWillShow = Variable<Bool>(false)
    
    var loginView: LoginView {
        return view as! LoginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let contentView = LoginView(frame: CGRect.zero)
        view = contentView
        styleNavBar()
        bindUI()
    }
    
    private func styleNavBar() {
        if let navigationController = self.parent as? UINavigationController {
            navigationController.navigationBar.barTintColor = UIColor(named: "Amarant") ?? #colorLiteral(red: 0.5870615244, green: 0.0167502109, blue: 0.2885163724, alpha: 1)
            navigationController.navigationBar.isTranslucent = false
            navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationController.navigationBar.shadowImage = UIImage()
        }
    }
    
    private func bindUI() {
        _ = loginView.emailTextField.rx.text.map { $0 ?? "" }.bind(to: loginViewModel.emailText)
        _ = loginView.passwordTextField.rx.text.map { $0 ?? ""}.bind(to: loginViewModel.passwordText)
        
        _ = loginViewModel.isValid.bind(to: loginView.loginButton.rx.isEnabled)
        
        loginViewModel.user
            .asObservable()
            .skip(1)
            .subscribe { [weak self] user in
            if user.element != nil {
                print("USER_EVENT - LoginViewController - logged in")
                self?.pushViewController(viewController: MainViewController())
            } else {
                print("USER_EVENT - LoginViewController - not logged in")
                self?.loginView.loginButton.isEnabled = true
            }
        }.disposed(by: bag)
        
        loginView.emailTextField.rx
            .controlEvent([.editingDidEnd])
            .asObservable()
            .subscribe(onNext: { [weak self] _ in
                self?.loginView.passwordTextField.becomeFirstResponder()
        }).disposed(by: bag)
        
        loginView.passwordTextField.rx
            .controlEvent([.editingDidEnd])
            .asObservable()
            .subscribe(onNext: { [weak self] in
                self?.loginView.passwordTextField.resignFirstResponder()
        }).disposed(by: bag)
        
        loginView.loginButton.rx
            .tap
            .throttle(3, latest: false, scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] _ in
                print("USER_EVENT - LoginViewController - login button pressed")
                self?.loginViewModel.login()
        }).disposed(by: bag)
        
        _ = loginView.registerButton.rx
            .tap
            .throttle(0.5, latest: false, scheduler: MainScheduler.instance).subscribe { [weak self] _ in
                self?.pushViewController(viewController: RegisterViewController())
        }
        
        NotificationCenter.default.rx
            .notification(UIDevice.orientationDidChangeNotification)
            .subscribe(onNext: { [weak self] orientation in
                self?.drawLayoutDependingOnScreenOrientation()
        }).disposed(by: bag)
        
        NotificationCenter.default.rx
            .notification(UIResponder.keyboardWillShowNotification)
            .subscribe({ [weak self] notification in
                self?.keyBoardWillShow(notification: notification.element)
        }).disposed(by: bag)
        
        NotificationCenter.default.rx
            .notification(UIResponder.keyboardWillHideNotification)
            .subscribe({ [weak self] notification in
                self?.keyBoardWillHide(notification: notification.element)
        }).disposed(by: bag)
    }
    
    fileprivate func pushViewController(viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func drawLayoutDependingOnScreenOrientation(){
        if UIDevice.current.orientation == UIDeviceOrientation.landscapeLeft {
            print("Device orientation - UIDeviceOrientation.landscapeLeft")
            loginView.activateLandscape(inLeftOrientation: true)
        } else if UIDevice.current.orientation == UIDeviceOrientation.landscapeRight {
            print("Device orientation - UIDeviceOrientation.landscapeRight")
            loginView.activateLandscape(inLeftOrientation: false)
        } else if UIDevice.current.orientation == UIDeviceOrientation.portrait {
            print("Device orientation - UIDeviceOrientation.portrait")
            loginView.activatePortrait(upsideDown: false)
        } else if UIDevice.current.orientation == UIDeviceOrientation.portraitUpsideDown {
            print("Device orientation - UIDeviceOrientation.portraitUpsideDown")
            loginView.activatePortrait(upsideDown: true)
        } else if UIDevice.current.orientation == UIDeviceOrientation.unknown {
            print("Device orientation - UIDeviceOrientation.unknown")
            loginView.activatePortrait(upsideDown: false)
        }
    }
    
    func keyBoardWillShow(notification: Notification?){
        var keyboardHeight: CGFloat = 200
        if let keyboardFrame: NSValue = notification?.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            keyboardHeight = (keyboardRectangle.height)
        }
        
        print("Keyboard_height - \(keyboardHeight)")
        loginView.scrollViewBottomConstraint.constant = -keyboardHeight
        loginView.scrollView.setNeedsUpdateConstraints()
    }
    
    func keyBoardWillHide(notification: Notification?){
        loginView.scrollViewBottomConstraint.constant = 0
        loginView.scrollView.setNeedsUpdateConstraints()
    }
}
