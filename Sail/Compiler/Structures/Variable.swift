//
//  Variable.swift
//  Sail
//
//  Created by Gerardo Osio on 5/4/19.
//  Copyright © 2019 Gerardo Osio. All rights reserved.
//

import Foundation

class Variable {
    
    // MARK: - Properties
    
    var name: String!
    var type: DataType!
    var address: Int?
    var arraySize: Int?
    
    
    
    // MARK: - Initializers
    
    init(name: String, type: DataType, address: Int? = nil, arraySize: Int? = nil) {
        self.name = name
        self.type = type
        self.address = address
        self.arraySize = arraySize
    }
    
    
    
    // MARK: - Methods
    
    func isArray() -> Bool {
        return self.arraySize != nil
    }
}
