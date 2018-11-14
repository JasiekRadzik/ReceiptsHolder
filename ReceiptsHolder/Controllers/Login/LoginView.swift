//
//  LoginView.swift
//  ReceiptsHolder
//
//  Created by Jan Radzikowski on 02/11/2018.
//  Copyright © 2018 Jan Radzikowski. All rights reserved.
//

import Foundation
import UIKit

class LoginView: GeneralView {
    
    let mainPortraitView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let leftLandscapeView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let rightLandscapeView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "LoginImage")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let credentialsStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 0
        view.distribution = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var emailSmallLabel: UILabel = {
        let view = UILabel()
        view.text = NSLocalizedString("email", comment: "")
        view.textAlignment = .center
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        view.textColor = UIColor(named: "WhiteAlpha55") ?? #colorLiteral(red: 0.9998916984, green: 1, blue: 0.9998809695, alpha: 0.55)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        }()
    
    var emailTextField: UITextField = {
        let view = UITextField()
        view.tag = 1
        view.keyboardType = UIKeyboardType.emailAddress
        view.attributedPlaceholder = NSAttributedString(string: "@\(NSLocalizedString("email", comment: ""))", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        view.text = ""
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        view.textColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        }()
    
    let emailTextBackgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16.5
        view.backgroundColor = UIColor(named: "LoginCredentialsViewTransparentBackgroundColor") ?? #colorLiteral(red: 0.005643308163, green: 0.07864312083, blue: 0.07901281863, alpha: 0.22)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let passwordSmallLabel: UILabel = {
        let view = UILabel()
        view.text = NSLocalizedString("password", comment: "")
        view.textAlignment = .center
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        view.textColor = UIColor(named: "WhiteAlpha55") ?? #colorLiteral(red: 0.9998916984, green: 1, blue: 0.9998809695, alpha: 0.55)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let passwordTextField: UITextField = {
        let view = UITextField()
        view.tag = 2
        view.isSecureTextEntry = true
        view.attributedPlaceholder = NSAttributedString(string: "@\(NSLocalizedString("password", comment: ""))", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        view.textColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let passwordTextBackgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16.5
        view.backgroundColor = UIColor(named: "LoginCredentialsViewTransparentBackgroundColor") ?? #colorLiteral(red: 0.005643308163, green: 0.07864312083, blue: 0.07901281863, alpha: 0.22)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let buttonsStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 30
        view.alignment = .center
        view.distribution = UIStackView.Distribution.equalSpacing
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let loginButton: UIButton = {
        let view = UIButton()
        view.setTitle(NSLocalizedString("login", comment: ""), for: .normal)
        let pressedColor = UIColor(named: "GrayLight") ?? .gray
        view.setTitleColor(pressedColor, for: .highlighted)
        view.setTitleColor(UIColor(named: "Amarant") ?? #colorLiteral(red: 0.5870615244, green: 0.0167502109, blue: 0.2885163724, alpha: 1), for: .normal)
        view.layer.cornerRadius = 25
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let registerButton: UIButton = {
        let view = UIButton()
        view.setTitle(NSLocalizedString("register", comment: ""), for: .normal)
        view.layer.cornerRadius = 25
        view.setTitleColor(.white, for: .normal)
        let pressedColor = UIColor(named: "GrayLight") ?? .gray
        view.setTitleColor(pressedColor, for: .highlighted)
        view.backgroundColor = UIColor(named: "LoginCredentialsViewTransparentBackgroundColor") ?? #colorLiteral(red: 0.005643308163, green: 0.07864312083, blue: 0.07901281863, alpha: 0.22)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // Size variables in Portrait
    private var imagePortraitTopMargin: CGFloat = 100
    private var imagePortraitHeightWidth: CGFloat = 164
    private var credentialsStackPortraitTopMargin: CGFloat = 100
    private var spaceBetweenLabelAndTextField: CGFloat = 4
    private var emailTextFieldPortraitLeadingMargin: CGFloat = 20
    private var passwordTextFieldPortraitLeadingMargin: CGFloat = 35
    private var textFieldPortraitHeight: CGFloat = 34
    private var emailBackgroundViewPortraitLeadingMargin: CGFloat = 80
    private var passwordBackgroundViewPortraitTrailingMargin: CGFloat = -80
    private var spaceBetweenEmailAndPassword: CGFloat = 20
    private var spaceBetweenCredentialsAndButtonsStackViews: CGFloat = 82
    private var buttonHeight: CGFloat = 50
    private var buttonsStackViewPortraitLeadingMargin: CGFloat = 75
    private var buttonsStackViewPortraitTrailingMargin: CGFloat = -75
    private var buttonsStackViewPortraitSpacing: CGFloat = 30
    
    // Size variables in Landscape
    private var credentialsStackViewLandscapeLeadingMargin: CGFloat = -15
    private var credentialsStackViewLandscapeTrailingMargin: CGFloat = 15
    private var emailBackgroundViewLandscapeTrailingMargin: CGFloat = 0
    private var passwordBackgroundViewLandscapeTrailingMargin: CGFloat = 0
    private var emailTextFieldLandscapeLeadingMargin: CGFloat = 35
    private var emailTextFieldSpecialIphoneTypeLandscapeLeadingMargin: CGFloat = 50
    private var passwordTextFieldLandscapeLeadingMargin: CGFloat = 35
    private var passwordTextFieldSpecialIphoneTypeLandscapeLeadingMargin: CGFloat = 50
    private var buttonLandscapeLeadingMargin: CGFloat = 20
    private var buttonLandscapeTrailingMargin: CGFloat = -20
    private var buttonsStackViewLandscapeSpacing: CGFloat = 15
    
    var portraitConstraints : [NSLayoutConstraint] = []
    var landScapeConstraints : [NSLayoutConstraint] = []
    
    var scrollViewBottomConstraint: NSLayoutConstraint = NSLayoutConstraint()
    private var scrollViewGuidePortraitLeadingConstraint: NSLayoutConstraint = NSLayoutConstraint()
    private var scrollViewSelfLandscapeLeadingConstraint: NSLayoutConstraint = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(named: "Amarant") ?? #colorLiteral(red: 0.5870615244, green: 0.0167502109, blue: 0.2885163724, alpha: 1)
        changeVarsDependingOnIphoneType()
        let guide = self.safeAreaLayoutGuide
        
        self.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollViewBottomConstraint = NSLayoutConstraint(item: scrollView, attribute: .bottom, relatedBy: .equal, toItem: guide, attribute: .bottom, multiplier: 1.0, constant: 0)
        scrollViewBottomConstraint.isActive = true
        
        scrollView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        scrollViewGuidePortraitLeadingConstraint = NSLayoutConstraint(item: scrollView, attribute: .leading, relatedBy: .equal, toItem: guide, attribute: .leading, multiplier: 1, constant: 0)
        scrollViewSelfLandscapeLeadingConstraint = NSLayoutConstraint(item: scrollView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0)
        scrollView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        addConstraintsToList()
        
        initFonts()
    }
    
    private func initFonts() {
        emailSmallLabel.font = scaledFont.font(forTextStyle: UIFont.TextStyle.callout)
        passwordSmallLabel.font = scaledFont.font(forTextStyle: UIFont.TextStyle.callout)
        emailTextField.font = scaledFont.font(forTextStyle: UIFont.TextStyle.title2)
        passwordTextField.font = scaledFont.font(forTextStyle: UIFont.TextStyle.title2)
        loginButton.titleLabel?.font = scaledFont.font(forTextStyle: UIFont.TextStyle.headline)
        registerButton.titleLabel?.font = scaledFont.font(forTextStyle: UIFont.TextStyle.headline)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createMainPortraitView() {
        contentView.addSubview(mainPortraitView)
        
        // Main Portrait View
        mainPortraitView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        mainPortraitView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        mainPortraitView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        mainPortraitView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        
        // Adding subviews
        mainPortraitView.addSubview(imageView)
        mainPortraitView.addSubview(credentialsStackView)
        mainPortraitView.addSubview(buttonsStackView)
        
        imageView.centerXAnchor.constraint(equalTo: mainPortraitView.centerXAnchor, constant: 0).isActive = true
        imageView.topAnchor.constraint(equalTo: mainPortraitView.topAnchor, constant: imagePortraitTopMargin).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: imagePortraitHeightWidth).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: imagePortraitHeightWidth).isActive = true
        
        // Credentials Stack View
        credentialsStackView.leadingAnchor.constraint(equalTo: mainPortraitView.leadingAnchor, constant: -15).isActive = true
        credentialsStackView.trailingAnchor.constraint(equalTo: mainPortraitView.trailingAnchor, constant: 15).isActive = true
        credentialsStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: credentialsStackPortraitTopMargin).isActive = true
        
        // Email Credentials
        credentialsStackView.addArrangedSubview(emailSmallLabel)
        emailSmallLabel.leadingAnchor.constraint(equalTo: credentialsStackView.leadingAnchor, constant: 0).isActive = true
        emailSmallLabel.trailingAnchor.constraint(equalTo: credentialsStackView.trailingAnchor, constant: 0).isActive = true
        
        credentialsStackView.setCustomSpacing(spaceBetweenLabelAndTextField, after: emailSmallLabel)
        
        credentialsStackView.addArrangedSubview(emailTextBackgroundView)
        emailTextBackgroundView.leadingAnchor.constraint(equalTo: credentialsStackView.leadingAnchor, constant: emailBackgroundViewPortraitLeadingMargin).isActive = true
        emailTextBackgroundView.trailingAnchor.constraint(equalTo: credentialsStackView.trailingAnchor, constant: 0).isActive = true
        emailTextBackgroundView.heightAnchor.constraint(equalToConstant: textFieldPortraitHeight).isActive = true
        
        emailTextBackgroundView.addSubview(emailTextField)
        emailTextField.leadingAnchor.constraint(equalTo: emailTextBackgroundView.leadingAnchor, constant: emailTextFieldPortraitLeadingMargin).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: emailTextBackgroundView.trailingAnchor, constant: 0).isActive = true
        emailTextField.topAnchor.constraint(equalTo: emailTextBackgroundView.topAnchor, constant: 0).isActive = true
        emailTextField.bottomAnchor.constraint(equalTo: emailTextBackgroundView.bottomAnchor, constant: 0).isActive = true
        
        // Space between email and password
        credentialsStackView.setCustomSpacing(spaceBetweenEmailAndPassword, after: emailTextBackgroundView)
        
        // Password Credentials
        credentialsStackView.addArrangedSubview(passwordSmallLabel)
        passwordSmallLabel.leadingAnchor.constraint(equalTo: credentialsStackView.leadingAnchor, constant: 0).isActive = true
        passwordSmallLabel.trailingAnchor.constraint(equalTo: credentialsStackView.trailingAnchor, constant: 0).isActive = true
        
        credentialsStackView.setCustomSpacing(spaceBetweenLabelAndTextField, after: passwordSmallLabel)
        
        credentialsStackView.addArrangedSubview(passwordTextBackgroundView)
        passwordTextBackgroundView.leadingAnchor.constraint(equalTo: credentialsStackView.leadingAnchor, constant: 0).isActive = true
        passwordTextBackgroundView.trailingAnchor.constraint(equalTo: credentialsStackView.trailingAnchor, constant: passwordBackgroundViewPortraitTrailingMargin).isActive = true
        passwordTextBackgroundView.heightAnchor.constraint(equalToConstant: textFieldPortraitHeight).isActive = true
        
        passwordTextBackgroundView.addSubview(passwordTextField)
        passwordTextField.leadingAnchor.constraint(equalTo: passwordTextBackgroundView.leadingAnchor, constant: passwordTextFieldPortraitLeadingMargin).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: passwordTextBackgroundView.trailingAnchor, constant: 0).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: passwordTextBackgroundView.topAnchor, constant: 0).isActive = true
        passwordTextField.bottomAnchor.constraint(equalTo: passwordTextBackgroundView.bottomAnchor, constant: 0).isActive = true
        
        // Buttons stack view
        buttonsStackView.leadingAnchor.constraint(equalTo: mainPortraitView.leadingAnchor, constant: buttonsStackViewPortraitLeadingMargin).isActive = true
        buttonsStackView.trailingAnchor.constraint(equalTo: mainPortraitView.trailingAnchor, constant: buttonsStackViewPortraitTrailingMargin).isActive = true
        buttonsStackView.topAnchor.constraint(equalTo: credentialsStackView.bottomAnchor, constant: spaceBetweenCredentialsAndButtonsStackViews).isActive = true
        buttonsStackView.bottomAnchor.constraint(equalTo: mainPortraitView.bottomAnchor, constant: 0).isActive = true
        
        buttonsStackView.spacing = buttonsStackViewPortraitSpacing
        
        buttonsStackView.addArrangedSubview(loginButton)
        loginButton.leadingAnchor.constraint(equalTo: buttonsStackView.leadingAnchor, constant: 0).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: buttonsStackView.trailingAnchor, constant: 0).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        
        buttonsStackView.addArrangedSubview(registerButton)
        registerButton.leadingAnchor.constraint(equalTo: buttonsStackView.leadingAnchor, constant: 0).isActive = true
        registerButton.trailingAnchor.constraint(equalTo: buttonsStackView.trailingAnchor, constant: 0).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        
    }
    
    private func createLandscapeView(inLeftOrientation isLeftOriented: Bool) {
        let guide = self.safeAreaLayoutGuide
        contentView.addSubview(leftLandscapeView)
        contentView.addSubview(rightLandscapeView)
        
        leftLandscapeView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        leftLandscapeView.heightAnchor.constraint(equalTo: guide.heightAnchor, multiplier: 1).isActive = true
        leftLandscapeView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 9/20).isActive = true
        leftLandscapeView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0).isActive = true
        
        rightLandscapeView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        rightLandscapeView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        
        rightLandscapeView.heightAnchor.constraint(equalTo: guide.heightAnchor, multiplier: 1).isActive = true
        rightLandscapeView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 9/20).isActive = true
        rightLandscapeView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 1).isActive = true
        //rightLandscapeView.leadingAnchor.constraint(equalTo: leftLandscapeView.trailingAnchor, constant: 1).isActive = true
        
        leftLandscapeView.addSubview(credentialsStackView)
        
        // Credentials Stack View
        credentialsStackView.leadingAnchor.constraint(equalTo: leftLandscapeView.leadingAnchor, constant: credentialsStackViewLandscapeLeadingMargin).isActive = true
        credentialsStackView.trailingAnchor.constraint(equalTo: leftLandscapeView.trailingAnchor, constant: credentialsStackViewLandscapeTrailingMargin).isActive = true
        credentialsStackView.centerYAnchor.constraint(equalTo: leftLandscapeView.centerYAnchor, constant: 0).isActive = true
        
        // Email Credentials
        credentialsStackView.addArrangedSubview(emailSmallLabel)
        emailSmallLabel.leadingAnchor.constraint(equalTo: credentialsStackView.leadingAnchor, constant: 0).isActive = true
        emailSmallLabel.trailingAnchor.constraint(equalTo: credentialsStackView.trailingAnchor, constant: 0).isActive = true
        
        credentialsStackView.setCustomSpacing(spaceBetweenLabelAndTextField, after: emailSmallLabel)
        
        credentialsStackView.addArrangedSubview(emailTextBackgroundView)
        emailTextBackgroundView.leadingAnchor.constraint(equalTo: credentialsStackView.leadingAnchor, constant: 0).isActive = true
        emailTextBackgroundView.trailingAnchor.constraint(equalTo: credentialsStackView.trailingAnchor, constant: emailBackgroundViewLandscapeTrailingMargin).isActive = true
        emailTextBackgroundView.heightAnchor.constraint(equalToConstant: textFieldPortraitHeight).isActive = true
        
        emailTextBackgroundView.addSubview(emailTextField)
        
        if iphoneType == .XXs || iphoneType == .Xr || iphoneType == .XsMax {
            if isLeftOriented {
                emailTextField.leadingAnchor.constraint(equalTo: emailTextBackgroundView.leadingAnchor, constant: emailTextFieldSpecialIphoneTypeLandscapeLeadingMargin).isActive = true
            } else {
                emailTextField.leadingAnchor.constraint(equalTo: emailTextBackgroundView.leadingAnchor, constant: emailTextFieldLandscapeLeadingMargin).isActive = true
            }
        } else {
            emailTextField.leadingAnchor.constraint(equalTo: emailTextBackgroundView.leadingAnchor, constant: emailTextFieldLandscapeLeadingMargin).isActive = true
        }
        
        emailTextField.trailingAnchor.constraint(equalTo: emailTextBackgroundView.trailingAnchor, constant: 0).isActive = true
        emailTextField.topAnchor.constraint(equalTo: emailTextBackgroundView.topAnchor, constant: 0).isActive = true
        emailTextField.bottomAnchor.constraint(equalTo: emailTextBackgroundView.bottomAnchor, constant: 0).isActive = true
        
        // Space between email and password
        credentialsStackView.setCustomSpacing(spaceBetweenEmailAndPassword, after: emailTextBackgroundView)
        
        // Password Credentials
        credentialsStackView.addArrangedSubview(passwordSmallLabel)
        passwordSmallLabel.leadingAnchor.constraint(equalTo: credentialsStackView.leadingAnchor, constant: 0).isActive = true
        passwordSmallLabel.trailingAnchor.constraint(equalTo: credentialsStackView.trailingAnchor, constant: 0).isActive = true
        
        credentialsStackView.setCustomSpacing(spaceBetweenLabelAndTextField, after: passwordSmallLabel)
        
        credentialsStackView.addArrangedSubview(passwordTextBackgroundView)
        passwordTextBackgroundView.leadingAnchor.constraint(equalTo: credentialsStackView.leadingAnchor, constant: 0).isActive = true
        passwordTextBackgroundView.trailingAnchor.constraint(equalTo: credentialsStackView.trailingAnchor, constant: passwordBackgroundViewLandscapeTrailingMargin).isActive = true
        passwordTextBackgroundView.heightAnchor.constraint(equalToConstant: textFieldPortraitHeight).isActive = true
        
        passwordTextBackgroundView.addSubview(passwordTextField)
        
        if iphoneType == .XXs || iphoneType == .Xr || iphoneType == .XsMax {
            if isLeftOriented {
                passwordTextField.leadingAnchor.constraint(equalTo: passwordTextBackgroundView.leadingAnchor, constant: passwordTextFieldSpecialIphoneTypeLandscapeLeadingMargin).isActive = true
            } else {
                passwordTextField.leadingAnchor.constraint(equalTo: passwordTextBackgroundView.leadingAnchor, constant: passwordTextFieldLandscapeLeadingMargin).isActive = true
            }
        } else {
            passwordTextField.leadingAnchor.constraint(equalTo: passwordTextBackgroundView.leadingAnchor, constant: passwordTextFieldLandscapeLeadingMargin).isActive = true
        }
        
        passwordTextField.trailingAnchor.constraint(equalTo: passwordTextBackgroundView.trailingAnchor, constant: 0).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: passwordTextBackgroundView.topAnchor, constant: 0).isActive = true
        passwordTextField.bottomAnchor.constraint(equalTo: passwordTextBackgroundView.bottomAnchor, constant: 0).isActive = true
        
        // Buttons Stack View
        rightLandscapeView.addSubview(buttonsStackView)
        buttonsStackView.leadingAnchor.constraint(equalTo: rightLandscapeView.leadingAnchor, constant: 0).isActive = true
        buttonsStackView.trailingAnchor.constraint(equalTo: rightLandscapeView.trailingAnchor, constant: 0).isActive = true
        buttonsStackView.centerYAnchor.constraint(equalTo: rightLandscapeView.centerYAnchor, constant: 0).isActive = true
        
        buttonsStackView.spacing = buttonsStackViewLandscapeSpacing
        
        buttonsStackView.addArrangedSubview(imageView)
        imageView.heightAnchor.constraint(equalToConstant: imagePortraitHeightWidth).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: imagePortraitHeightWidth).isActive = true
        
        buttonsStackView.addArrangedSubview(loginButton)
        
        loginButton.leadingAnchor.constraint(equalTo: buttonsStackView.leadingAnchor, constant: buttonLandscapeLeadingMargin).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: buttonsStackView.trailingAnchor, constant: buttonLandscapeTrailingMargin).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        
        buttonsStackView.addArrangedSubview(registerButton)
        registerButton.leadingAnchor.constraint(equalTo: buttonsStackView.leadingAnchor, constant: buttonLandscapeLeadingMargin).isActive = true
        registerButton.trailingAnchor.constraint(equalTo: buttonsStackView.trailingAnchor, constant: buttonLandscapeTrailingMargin).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
    }
    
    private func addConstraintsToList() {
        portraitConstraints.append(scrollViewGuidePortraitLeadingConstraint)
        landScapeConstraints.append(scrollViewSelfLandscapeLeadingConstraint)
    }
    
    func activatePortrait(upsideDown isUpsideDown: Bool) {
        NSLayoutConstraint.deactivate(landScapeConstraints)
        NSLayoutConstraint.activate(portraitConstraints)
        resetCredentialsStackView()
        leftLandscapeView.removeFromSuperview()
        rightLandscapeView.removeFromSuperview()
        createMainPortraitView()
        scrollView.updateConstraints()
    }
    
    func activateLandscape(inLeftOrientation isLeftOriented: Bool) {
        NSLayoutConstraint.deactivate(portraitConstraints)
        NSLayoutConstraint.activate(landScapeConstraints)
        resetCredentialsStackView()
        mainPortraitView.removeFromSuperview()
        createLandscapeView(inLeftOrientation: isLeftOriented)
        scrollView.updateConstraints()
    }
    
    private func resetCredentialsStackView() {
        imageView.removeFromSuperview()
        loginButton.removeFromSuperview()
        registerButton.removeFromSuperview()
        buttonsStackView.removeFromSuperview()
        emailSmallLabel.removeFromSuperview()
        emailTextField.removeFromSuperview()
        emailTextBackgroundView.removeFromSuperview()
        passwordSmallLabel.removeFromSuperview()
        passwordTextField.removeFromSuperview()
        passwordTextBackgroundView.removeFromSuperview()
    }
    
    private func changeVarsDependingOnIphoneType() {
        switch iphoneType {
        case .Medium:
            imagePortraitTopMargin = 70
            imagePortraitHeightWidth = 140
            imagePortraitHeightWidth = 140
            credentialsStackPortraitTopMargin = 60
            spaceBetweenCredentialsAndButtonsStackViews = 60
            emailTextFieldLandscapeLeadingMargin = 35
            passwordTextFieldLandscapeLeadingMargin = 35
        default:
            return
        }
        
    }
}
