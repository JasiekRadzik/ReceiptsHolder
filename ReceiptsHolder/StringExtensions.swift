//
//  StringExtensions.swift
//  ReceiptsHolder
//
//  Created by Jan Radzikowski on 08/11/2018.
//  Copyright © 2018 Jan Radzikowski. All rights reserved.
//

import Foundation
class StringExtensions {
    
}
extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}
