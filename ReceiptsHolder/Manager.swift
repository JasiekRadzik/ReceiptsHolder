//
//  Manager.swift
//  ReceiptsHolder
//
//  Created by Jan Radzikowski on 06/11/2018.
//  Copyright © 2018 Jan Radzikowski. All rights reserved.
//

import Foundation

class Manager {
    private static var manager: Manager = {
        let manager = Manager()
        return manager
    }()
    
    private init() {
        
    }
    
    class func shared() -> Manager {
        return manager
    }
    
    let iphoneType = ScreenSize.getScreenSize()
}
