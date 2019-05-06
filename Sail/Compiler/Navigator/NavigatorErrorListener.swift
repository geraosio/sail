//
//  NavigatorErrorListener.swift
//  Sail
//
//  Created by Gerardo Osio on 4/20/19.
//  Copyright © 2019 Gerardo Osio. All rights reserved.
//

import Foundation
import Antlr4

class NavigatorErrorListener: BaseErrorListener {
    
    override func syntaxError<T>(_ recognizer: Recognizer<T>,
                             _ offendingSymbol: AnyObject?,
                             _ line: Int,
                             _ charPositionInLine: Int,
                             _ msg: String,
                             _ e: AnyObject?
        ) {
        
        let parseError = NavigatorError(type: .syntax, atLine: line, positionInLine: charPositionInLine, description: msg)
        Navigator.shared.errors.append(parseError)
    }
}
