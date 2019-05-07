//
//  Operator.swift
//  Sail
//
//  Created by Gerardo Osio on 4/21/19.
//  Copyright © 2019 Gerardo Osio. All rights reserved.
//

import Foundation

enum Operator: String {
    
    // MARK: - Arithmetic
    case addition           = "+"
    case multiplication     = "*"
    case subtraction       = "-"
    case division           = "/"

    // MARK: - Logical
    case and                = "&&"
    case or                 = "||"
    case not                = "!"
    
    // MARK: - Relational
    case equal              = "=="
    case notEqual           = "!="
    case greater            = ">"
    case less               = "<"
    case greaterEqual       = ">="
    case lessEqual          = "<="
    
    // MARK: - Language Functions
    case print              = "print"
    
    // MARK: - Others
    case assign             = "="
    case falseBottom        = "("
    
    case end                = "end"
}
