//
//  GeneralView.swift
//  ReceiptsHolder
//
//  Created by Jan Radzikowski on 02/11/2018.
//  Copyright © 2018 Jan Radzikowski. All rights reserved.
//

import Foundation
import UIKit
class GeneralView: UIView {
    
    private let fontName = "Roboto-MediumItalic"
    let manager = Manager.shared()
    lazy var iphoneType = manager.iphoneType
    
    lazy var scaledFont: ScaledFont = {
        return ScaledFont(fontName: fontName)
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
}
