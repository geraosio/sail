//
//  Function.swift
//  Sail
//
//  Created by Gerardo Osio on 5/4/19.
//  Copyright © 2019 Gerardo Osio. All rights reserved.
//

import Foundation

// MARK: - Function
// Function class is being used all over the compiler.
// It works as the scope by keeping track of the variables and parameters,
// and keeps track of the return data type, quadruple index and function address.

class Function {
    
    // MARK: - Properties
    
    var name: String!
    var parameters: [Variable]?
    var variables: [String: Variable]?
    var returnType: DataType?
    var quadrupleIndex: Int?
    var address: Int?
    
    
    
    // MARK: - Initializers
    
    init(name: String, hasParameters: Bool = false, returnType: DataType? = nil, quadrupleIndex: Int? = nil, address: Int? = nil) {
        
        self.name = name
        
        // If it has parameters initialize Dictionary parameters
        if hasParameters {
            self.parameters = []
        } else {
            self.variables = [:]
        }
        
        self.returnType = returnType
        self.quadrupleIndex = quadrupleIndex
        self.address = address
    }
    
    
    
    // MARK: - Methods
    
    func isGlobal() -> Bool {
        return name == "sail" || name == "Sail"
    }
    
    // Get variable
    // Returns either the parameter if it's a defined function or the variables if it's the global function
    // This function is called from almost every action in the syntax and in some parts of the virtual machine.
    func getVariable(name: String) -> Variable? {
        if let parameters = self.parameters {
            for parameter in parameters {
                if parameter.name == name {
                    return parameter
                }
            }
        }
        
        if let variables = self.variables {
            return variables[name]
        }
        
        return nil
    }
    
    func save(variable: Variable) {
        if variables != nil {
            variables?.updateValue(variable, forKey: variable.name)
        } else {
            parameters?.append(variable)
        }
    }
}
