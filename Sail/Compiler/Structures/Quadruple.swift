//
//  Quadruple.swift
//  Sail
//
//  Created by Gerardo Osio on 5/4/19.
//  Copyright © 2019 Gerardo Osio. All rights reserved.
//

import Foundation

class Quadruple {
    
    // MARK: - Properties
    
    var op: Operator
    var left: Int?
    var right: Int?
    var result: Int?
    
    
    
    // MARK: - Initializers
    
    init(op: Operator, left: Int? = nil, right: Int? = nil, result: Int? = nil) {
        self.op = op
        self.left = left
        self.right = right
        self.result = result
    }
    
}
