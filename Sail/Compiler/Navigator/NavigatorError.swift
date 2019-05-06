//
//  NavigatorError.swift
//  Sail
//
//  Created by Gerardo Osio on 5/6/19.
//  Copyright © 2019 Gerardo Osio. All rights reserved.
//

import Foundation

enum NavigatorErrorType {
    case syntax
    case semantic
    case compile
    case other
}

class NavigatorError: Error {
    
    // MARK: - Properties
    var type: NavigatorErrorType!
    var atLine: Int?
    var positionInLine: Int?
    var description: String!
    
    var message: String {
        get {
            if let line = atLine, let position = positionInLine {
                return "line \(line):\(position) \(description!)"
            } else {
                return description
            }
        }
    }
    
    // MARK: - Initializers
    
    init(type: NavigatorErrorType = .other, atLine: Int? = nil, positionInLine: Int? = nil, description: String) {
        self.type = type
        self.atLine = atLine
        self.positionInLine = positionInLine
        self.description = description
    }
}
