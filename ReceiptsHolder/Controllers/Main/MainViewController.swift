//
//  MainViewController.swift
//  ReceiptsHolder
//
//  Created by Jan Radzikowski on 14/11/2018.
//  Copyright © 2018 Jan Radzikowski. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class MainViewController: GeneralViewController {
    
    var mainView: MainView {
        return view as! MainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let contentView = MainView(frame: CGRect.zero)
        view = contentView
        //styleNavBar()
    }
    
    private func styleNavBar() {
        if let navigationController = self.parent as? UINavigationController {
            navigationController.navigationBar.barTintColor = UIColor(named: "Blue Dark") ?? #colorLiteral(red: 0, green: 0.1450980392, blue: 0.1921568627, alpha: 1)
            navigationController.navigationBar.isTranslucent = false
            navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationController.navigationBar.shadowImage = UIImage()
        }
    }
}
