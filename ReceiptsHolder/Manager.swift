//
//  Manager.swift
//  ReceiptsHolder
//
//  Created by Jan Radzikowski on 06/11/2018.
//  Copyright © 2018 Jan Radzikowski. All rights reserved.
//
//  Manager is made to access some data, api etc. from wherever in app
//

import Foundation

class Manager {
    
    // variables accessed through Manager.shared()
    let iphoneType = ScreenSize.getScreenSize()
    let firebase = FirebaseModule()
    
    // Manager set up functions
    private static var manager: Manager = {
        let manager = Manager()
        return manager
    }()
    
    private init() {
        
    }
    
    class func shared() -> Manager {
        return manager
    }
}
