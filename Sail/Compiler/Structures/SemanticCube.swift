//
//  SemanticCube.swift
//  Sail
//
//  Created by Gerardo Osio on 4/21/19.
//  Copyright © 2019 Gerardo Osio. All rights reserved.
//

import Foundation

class SemanticCube {

    static func check(op: Operator, leftType: DataType, rightType: DataType) -> DataType {
        switch (op, leftType, rightType) {

        ///////////
        /// Int ///
        ///////////

        case (.addition, .int, .int): return .int
        case (.addition, .int, .float): return .float
        case (.addition, .int, .bool): return .error
        case (.addition, .int, .character): return .error
        case (.addition, .int, .string): return .error

        case (.multiplication, .int, .int): return .int
        case (.multiplication, .int, .float): return .float
        case (.multiplication, .int, .bool): return .error
        case (.multiplication, .int, .character): return .error
        case (.multiplication, .int, .string): return .error

        case (.substraction, .int, .int): return .int
        case (.substraction, .int, .float): return .float
        case (.substraction, .int, .bool): return .error
        case (.substraction, .int, .character): return .error
        case (.substraction, .int, .string): return .error

        case (.division, .int, .int): return .int
        case (.division, .int, .float): return .float
        case (.division, .int, .bool): return .error
        case (.division, .int, .character): return .error
        case (.division, .int, .string): return .error

        case (.and, .int, .int): return .error
        case (.and, .int, .float): return .error
        case (.and, .int, .bool): return .error
        case (.and, .int, .character): return .error
        case (.and, .int, .string): return .error

        case (.or, .int, .int): return .error
        case (.or, .int, .float): return .error
        case (.or, .int, .bool): return .error
        case (.or, .int, .character): return .error
        case (.or, .int, .string): return .error

        case (.equal, .int, .int): return .bool
        case (.equal, .int, .float): return .bool
        case (.equal, .int, .bool): return .error
        case (.equal, .int, .character): return .error
        case (.equal, .int, .string): return .error

        case (.notEqual, .int, .int): return .bool
        case (.notEqual, .int, .float): return .bool
        case (.notEqual, .int, .bool): return .error
        case (.notEqual, .int, .character): return .error
        case (.notEqual, .int, .string): return .error

        case (.greater, .int, .int): return .bool
        case (.greater, .int, .float): return .bool
        case (.greater, .int, .bool): return .error
        case (.greater, .int, .character): return .error
        case (.greater, .int, .string): return .error

        case (.less, .int, .int): return .bool
        case (.less, .int, .float): return .bool
        case (.less, .int, .bool): return .error
        case (.less, .int, .character): return .error
        case (.less, .int, .string): return .error

        case (.greaterEqual, .int, .int): return .bool
        case (.greaterEqual, .int, .float): return .bool
        case (.greaterEqual, .int, .bool): return .error
        case (.greaterEqual, .int, .character): return .error
        case (.greaterEqual, .int, .string): return .error

        case (.lessEqual, .int, .int): return .bool
        case (.lessEqual, .int, .float): return .bool
        case (.lessEqual, .int, .bool): return .error
        case (.lessEqual, .int, .character): return .error
        case (.lessEqual, .int, .string): return .error

        case (.assign, .int, .int): return .int
        case (.assign, .int, .float): return .int
        case (.assign, .int, .bool): return .error
        case (.assign, .int, .character): return .error
        case (.assign, .int, .string): return .error

        /////////////
        /// Float ///
        /////////////

        case (.addition, .float, .int): return .float
        case (.addition, .float, .float): return .float
        case (.addition, .float, .bool): return .error
        case (.addition, .float, .character): return .error
        case (.addition, .float, .string): return .error

        case (.multiplication, .float, .int): return .float
        case (.multiplication, .float, .float): return .float
        case (.multiplication, .float, .bool): return .error
        case (.multiplication, .float, .character): return .error
        case (.multiplication, .float, .string): return .error

        case (.substraction, .float, .int): return .float
        case (.substraction, .float, .float): return .float
        case (.substraction, .float, .bool): return .error
        case (.substraction, .float, .character): return .error
        case (.substraction, .float, .string): return .error

        case (.division, .float, .int): return .float
        case (.division, .float, .float): return .float
        case (.division, .float, .bool): return .error
        case (.division, .float, .character): return .error
        case (.division, .float, .string): return .error

        case (.and, .float, .int): return .error
        case (.and, .float, .float): return .error
        case (.and, .float, .bool): return .error
        case (.and, .float, .character): return .error
        case (.and, .float, .string): return .error

        case (.or, .float, .int): return .error
        case (.or, .float, .float): return .error
        case (.or, .float, .bool): return .error
        case (.or, .float, .character): return .error
        case (.or, .float, .string): return .error

        case (.equal, .float, .int): return .bool
        case (.equal, .float, .float): return .bool
        case (.equal, .float, .bool): return .error
        case (.equal, .float, .character): return .error
        case (.equal, .float, .string): return .error

        case (.notEqual, .float, .int): return .bool
        case (.notEqual, .float, .float): return .bool
        case (.notEqual, .float, .bool): return .error
        case (.notEqual, .float, .character): return .error
        case (.notEqual, .float, .string): return .error

        case (.greater, .float, .int): return .bool
        case (.greater, .float, .float): return .bool
        case (.greater, .float, .bool): return .error
        case (.greater, .float, .character): return .error
        case (.greater, .float, .string): return .error

        case (.less, .float, .int): return .bool
        case (.less, .float, .float): return .bool
        case (.less, .float, .bool): return .error
        case (.less, .float, .character): return .error
        case (.less, .float, .string): return .error

        case (.greaterEqual, .float, .int): return .bool
        case (.greaterEqual, .float, .float): return .bool
        case (.greaterEqual, .float, .bool): return .error
        case (.greaterEqual, .float, .character): return .error
        case (.greaterEqual, .float, .string): return .error

        case (.lessEqual, .float, .int): return .bool
        case (.lessEqual, .float, .float): return .bool
        case (.lessEqual, .float, .bool): return .error
        case (.lessEqual, .float, .character): return .error
        case (.lessEqual, .float, .string): return .error

        case (.assign, .float, .int): return .float
        case (.assign, .float, .float): return .float
        case (.assign, .float, .bool): return .error
        case (.assign, .float, .character): return .error
        case (.assign, .float, .string): return .error

        ////////////
        /// Bool ///
        ////////////

        case (.addition, .bool, .int): return .error
        case (.addition, .bool, .float): return .error
        case (.addition, .bool, .bool): return .error
        case (.addition, .bool, .character): return .error
        case (.addition, .bool, .string): return .error

        case (.multiplication, .bool, .int): return .error
        case (.multiplication, .bool, .float): return .error
        case (.multiplication, .bool, .bool): return .error
        case (.multiplication, .bool, .character): return .error
        case (.multiplication, .bool, .string): return .error

        case (.substraction, .bool, .int): return .error
        case (.substraction, .bool, .float): return .error
        case (.substraction, .bool, .bool): return .error
        case (.substraction, .bool, .character): return .error
        case (.substraction, .bool, .string): return .error

        case (.division, .bool, .int): return .error
        case (.division, .bool, .float): return .error
        case (.division, .bool, .bool): return .error
        case (.division, .bool, .character): return .error
        case (.division, .bool, .string): return .error

        case (.and, .bool, .int): return .error
        case (.and, .bool, .float): return .error
        case (.and, .bool, .bool): return .bool
        case (.and, .bool, .character): return .error
        case (.and, .bool, .string): return .error

        case (.or, .bool, .int): return .error
        case (.or, .bool, .float): return .error
        case (.or, .bool, .bool): return .bool
        case (.or, .bool, .character): return .error
        case (.or, .bool, .string): return .error

        case (.equal, .bool, .int): return .error
        case (.equal, .bool, .float): return .error
        case (.equal, .bool, .bool): return .bool
        case (.equal, .bool, .character): return .error
        case (.equal, .bool, .string): return .error

        case (.notEqual, .bool, .int): return .error
        case (.notEqual, .bool, .float): return .error
        case (.notEqual, .bool, .bool): return .bool
        case (.notEqual, .bool, .character): return .error
        case (.notEqual, .bool, .string): return .error

        case (.greater, .bool, .int): return .error
        case (.greater, .bool, .float): return .error
        case (.greater, .bool, .bool): return .error
        case (.greater, .bool, .character): return .error
        case (.greater, .bool, .string): return .error

        case (.less, .bool, .int): return .error
        case (.less, .bool, .float): return .error
        case (.less, .bool, .bool): return .error
        case (.less, .bool, .character): return .error
        case (.less, .bool, .string): return .error

        case (.greaterEqual, .bool, .int): return .error
        case (.greaterEqual, .bool, .float): return .error
        case (.greaterEqual, .bool, .bool): return .error
        case (.greaterEqual, .bool, .character): return .error
        case (.greaterEqual, .bool, .string): return .error

        case (.lessEqual, .bool, .int): return .error
        case (.lessEqual, .bool, .float): return .error
        case (.lessEqual, .bool, .bool): return .error
        case (.lessEqual, .bool, .character): return .error
        case (.lessEqual, .bool, .string): return .error

        case (.assign, .bool, .int): return .error
        case (.assign, .bool, .float): return .error
        case (.assign, .bool, .bool): return .bool
        case (.assign, .bool, .character): return .error
        case (.assign, .bool, .string): return .error

        /////////////////
        /// Character ///
        /////////////////

        case (.addition, .character, .int): return .error
        case (.addition, .character, .float): return .error
        case (.addition, .character, .bool): return .error
        case (.addition, .character, .character): return .error
        case (.addition, .character, .string): return .error

        case (.multiplication, .character, .int): return .error
        case (.multiplication, .character, .float): return .error
        case (.multiplication, .character, .bool): return .error
        case (.multiplication, .character, .character): return .error
        case (.multiplication, .character, .string): return .error

        case (.substraction, .character, .int): return .error
        case (.substraction, .character, .float): return .error
        case (.substraction, .character, .bool): return .error
        case (.substraction, .character, .character): return .error
        case (.substraction, .character, .string): return .error

        case (.division, .character, .int): return .error
        case (.division, .character, .float): return .error
        case (.division, .character, .bool): return .error
        case (.division, .character, .character): return .error
        case (.division, .character, .string): return .error

        case (.and, .character, .int): return .error
        case (.and, .character, .float): return .error
        case (.and, .character, .bool): return .error
        case (.and, .character, .character): return .error
        case (.and, .character, .string): return .error

        case (.or, .character, .int): return .error
        case (.or, .character, .float): return .error
        case (.or, .character, .bool): return .error
        case (.or, .character, .character): return .error
        case (.or, .character, .string): return .error

        case (.equal, .character, .int): return .error
        case (.equal, .character, .float): return .error
        case (.equal, .character, .bool): return .error
        case (.equal, .character, .character): return .bool
        case (.equal, .character, .string): return .bool

        case (.notEqual, .character, .int): return .error
        case (.notEqual, .character, .float): return .error
        case (.notEqual, .character, .bool): return .error
        case (.notEqual, .character, .character): return .bool
        case (.notEqual, .character, .string): return .bool

        case (.greater, .character, .int): return .error
        case (.greater, .character, .float): return .error
        case (.greater, .character, .bool): return .error
        case (.greater, .character, .character): return .error
        case (.greater, .character, .string): return .error

        case (.less, .character, .int): return .error
        case (.less, .character, .float): return .error
        case (.less, .character, .bool): return .error
        case (.less, .character, .character): return .error
        case (.less, .character, .string): return .error

        case (.greaterEqual, .character, .int): return .error
        case (.greaterEqual, .character, .float): return .error
        case (.greaterEqual, .character, .bool): return .error
        case (.greaterEqual, .character, .character): return .error
        case (.greaterEqual, .character, .string): return .error

        case (.lessEqual, .character, .int): return .error
        case (.lessEqual, .character, .float): return .error
        case (.lessEqual, .character, .bool): return .error
        case (.lessEqual, .character, .character): return .error
        case (.lessEqual, .character, .string): return .error

        case (.assign, .character, .int): return .error
        case (.assign, .character, .float): return .error
        case (.assign, .character, .bool): return .error
        case (.assign, .character, .character): return .character
        case (.assign, .character, .string): return .error

        //////////////
        /// String ///
        //////////////

        case (.addition, .string, .int): return .string
        case (.addition, .string, .float): return .string
        case (.addition, .string, .bool): return .error
        case (.addition, .string, .character): return .string
        case (.addition, .string, .string): return .string

        case (.multiplication, .string, .int): return .error
        case (.multiplication, .string, .float): return .error
        case (.multiplication, .string, .bool): return .error
        case (.multiplication, .string, .character): return .error
        case (.multiplication, .string, .string): return .error

        case (.substraction, .string, .int): return .error
        case (.substraction, .string, .float): return .error
        case (.substraction, .string, .bool): return .error
        case (.substraction, .string, .character): return .error
        case (.substraction, .string, .string): return .error

        case (.division, .string, .int): return .error
        case (.division, .string, .float): return .error
        case (.division, .string, .bool): return .error
        case (.division, .string, .character): return .error
        case (.division, .string, .string): return .error

        case (.and, .string, .int): return .error
        case (.and, .string, .float): return .error
        case (.and, .string, .bool): return .error
        case (.and, .string, .character): return .error
        case (.and, .string, .string): return .error

        case (.or, .string, .int): return .error
        case (.or, .string, .float): return .error
        case (.or, .string, .bool): return .error
        case (.or, .string, .character): return .error
        case (.or, .string, .string): return .error

        case (.equal, .string, .int): return .error
        case (.equal, .string, .float): return .error
        case (.equal, .string, .bool): return .error
        case (.equal, .string, .character): return .bool
        case (.equal, .string, .string): return .bool

        case (.notEqual, .string, .int): return .error
        case (.notEqual, .string, .float): return .error
        case (.notEqual, .string, .bool): return .error
        case (.notEqual, .string, .character): return .bool
        case (.notEqual, .string, .string): return .bool

        case (.greater, .string, .int): return .error
        case (.greater, .string, .float): return .error
        case (.greater, .string, .bool): return .error
        case (.greater, .string, .character): return .error
        case (.greater, .string, .string): return .error

        case (.less, .string, .int): return .error
        case (.less, .string, .float): return .error
        case (.less, .string, .bool): return .error
        case (.less, .string, .character): return .error
        case (.less, .string, .string): return .error

        case (.greaterEqual, .string, .int): return .error
        case (.greaterEqual, .string, .float): return .error
        case (.greaterEqual, .string, .bool): return .error
        case (.greaterEqual, .string, .character): return .error
        case (.greaterEqual, .string, .string): return .error

        case (.lessEqual, .string, .int): return .error
        case (.lessEqual, .string, .float): return .error
        case (.lessEqual, .string, .bool): return .error
        case (.lessEqual, .string, .character): return .error
        case (.lessEqual, .string, .string): return .error

        case (.assign, .string, .int): return .error
        case (.assign, .string, .float): return .error
        case (.assign, .string, .bool): return .error
        case (.assign, .string, .character): return .string
        case (.assign, .string, .string): return .string

        default:
            return .error
        }
    }
}
