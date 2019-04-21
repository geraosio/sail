//
//  Type.swift
//  Sail
//
//  Created by Gerardo Osio on 4/21/19.
//  Copyright © 2019 Gerardo Osio. All rights reserved.
//

import Foundation

enum DataType: String {
    case int        = "Int"
    case float      = "Float"
    case bool       = "Bool"
    case character  = "Character"
    case string     = "String"
    case void       = "Void"
    case error      = "Error"
    
    var string: String {
        get {
            return self.rawValue
        }
    }
}
