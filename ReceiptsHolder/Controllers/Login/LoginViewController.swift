//
//  LoginViewController.swift
//  ReceiptsHolder
//
//  Created by Jan Radzikowski on 02/11/2018.
//  Copyright © 2018 Jan Radzikowski. All rights reserved.
//

import Foundation
import UIKit
class LoginViewController: UIViewController {
    var loginView: LoginView {
        return view as! LoginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let contentView = LoginView(frame: CGRect.zero)
        view = contentView
        drawLayoutDependingOnScreenOrientation()
        addKeyboardObservers()
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
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        drawLayoutDependingOnScreenOrientation()
    }
    
    // keyboard
    private func addKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.keyBoardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.keyBoardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    @objc func keyBoardWillShow(notification: NSNotification){
        var keyboardHeight: CGFloat = 200
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            keyboardHeight = (keyboardRectangle.height)
        }
        
        print("Keyboard_height - \(keyboardHeight)")
        loginView.scrollViewBottomConstraint.constant = -keyboardHeight
        loginView.scrollView.setNeedsUpdateConstraints()
    }
    
    @objc func keyBoardWillHide(notification: NSNotification){
        loginView.scrollViewBottomConstraint.constant = 0
        loginView.scrollView.setNeedsUpdateConstraints()
    }
}
