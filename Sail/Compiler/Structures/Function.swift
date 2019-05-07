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
    var parameters: [String: Variable]?
    var variables: [String: Variable]?
    var returnType: DataType?
    
    
    
    // MARK: - Initializers
    
    init(name: String, hasParameters: Bool = false, returnType: DataType? = nil) {
        
        self.name = name
        
        // If it has parameters initialize Dictionary parameters
        if hasParameters {
            self.parameters = [:]
        } else {
            self.variables = [:]
        }
        
        self.returnType = returnType
    }
    
    
    
    // MARK: - Methods
    
    func isGlobal() -> Bool {
        return parameters != nil && returnType != nil
    }
    
    func getVariable(name: String) -> Variable? {
        if let parameters = self.parameters {
            return parameters[name]
        }
        
        if let variables = self.variables {
            return variables[name]
        }
        
        return nil
    }
    
    // MARK: Operator Overloading
    static func ==(left: Function, right: Function) -> Bool {
        return left.name == right.name
    }
}
