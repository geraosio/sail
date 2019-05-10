//
//  Variable.swift
//  Sail
//
//  Created by Gerardo Osio on 5/4/19.
//  Copyright © 2019 Gerardo Osio. All rights reserved.
//

import Foundation

// MARK: - Variable
// This is the structure that holds the information of a variable
// It is being used in the Function class to save all the variables
// in it's scope as well as the parameters.

class Variable {
    
    // MARK: - Properties
    
    var name: String!
    var type: DataType!
    var address: Int!
    var arraySize: Int?
    var parameterIndex: Int?
    
    
    
    // MARK: - Initializers
    
    init(name: String, type: DataType, address: Int, arraySize: Int? = nil, parameterIndex: Int? = nil) {
        self.name = name
        self.type = type
        self.address = address
        self.arraySize = arraySize
        self.parameterIndex = parameterIndex
    }
    
    
    
    // MARK: - Methods
    
    func isArray() -> Bool {
        return self.arraySize != nil
    }
}
