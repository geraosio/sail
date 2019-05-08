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
    case subtraction        = "-"
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
    
    // MARK: - Expressions
    case falseBottom        = "("
    
    // MARK: - Special Functions
    case print              = "print"
    
    // MARK: - Variables
    case assign             = "="
    
    // MARK: - Jumps
    case goto               = "goto"
    case gotoFalse          = "gotof"
    case gotoTrue           = "gotot"
    
    // MARK: - Functions
    case era                = "era"
    case parameter          = "param"
    case gosub              = "gosub"
    case returnValue        = "return"
    case endFunction        = "endFunction"
    
    // MARK: - End of Program
    case end                = "end"
    
    // MARK: - Computed Properties
    
    var string: String {
        get {
            return self.rawValue
        }
    }
}
