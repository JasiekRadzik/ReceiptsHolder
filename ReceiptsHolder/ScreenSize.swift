//
//  ScreenSize.swift
//  ReceiptsHolder
//
//  Created by Jan Radzikowski on 05/11/2018.
//  Copyright © 2018 Jan Radzikowski. All rights reserved.
//

import Foundation
import UIKit
class ScreenSize {
    static func getScreenSize()-> ScreenSizeEnum {
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 1136:
                return .Small
            case 1334:
                return .Medium
            case 1920, 2208:
                return .Large
            case 2436:
                return .XXs
            case 2688:
                return .XsMax
            case 1792:
                return .Xr
            default:
                return .Unknown
            }
        } else {
            return .Unknown
        }
    }
}

enum ScreenSizeEnum {
    case Xr
    case Small
    case Medium
    case XXs
    case XsMax
    case Unknown
    case Large
    
    func getDescription() -> String {
        var returnValue = ""
        switch self {
        case .Small:
            returnValue = "iPhone 5 or 5S or 5C"
        case .Medium:
            returnValue = "iPhone 6/6S/7/8"
        case .Large:
            returnValue = "iPhone 6+/6S+/7+/8+"
        case .XXs:
            returnValue = "iPhone X, Xs"
        case .XsMax:
            returnValue = "iPhone Xs Max"
        case .Xr:
            returnValue = "iPhone Xr"
        default:
            returnValue = "unknown"
        }
        return returnValue
    }
}
