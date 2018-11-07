//
//  MainViewController.swift
//  ReceiptsHolder
//
//  Created by Jan Radzikowski on 24/10/2018.
//  Copyright © 2018 Jan Radzikowski. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class ExampleViewController: GeneralViewController {
    
    var loginView: ExampleView {
        return view as! ExampleView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let contentView = ExampleView(frame: CGRect.zero)
        view = contentView
        drawLayoutDependingOnScreenOrientation()
    }
    
    private func drawLayoutDependingOnScreenOrientation(){
        if UIDevice.current.orientation.isLandscape {
            print("Landscape")
            loginView.activateLandscape()
            
        } else {
            print("Portrait")
            loginView.activatePortrait()
        }
    }
}
