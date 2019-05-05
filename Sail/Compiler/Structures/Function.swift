//
//  Function.swift
//  Sail
//
//  Created by Gerardo Osio on 5/4/19.
//  Copyright © 2019 Gerardo Osio. All rights reserved.
//

import Foundation

class Function {
    
    // MARK: - Properties
    
    var name: String!
    var parameters: [String: Variable]? // Since the grammar doesn't allow local variables this Dictionary will also work as the Local Variables
    var returnType: DataType?
    
    
    
    // MARK: - Initializers
    
    init(name: String, hasParameters: Bool = false, returnType: DataType? = nil) {
        
        self.name = name
        
        // If it has parameters initialize Dictionary parameters
        if hasParameters {
            self.parameters = [:]
        }
        
        self.returnType = returnType
    }
    
    
    
    // MARK: - Methods
    
    func isMain() -> Bool {
        return parameters != nil && returnType != nil
    }
    
    // MARK: Operator Overloading
    static func ==(left: Function, right: Function) -> Bool {
        return left.name == right.name
    }
}
