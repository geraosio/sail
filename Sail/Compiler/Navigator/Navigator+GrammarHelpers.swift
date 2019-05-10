//
//  Navigator+GrammarHelpers.swift
//  Sail
//
//  Created by Gerardo Osio on 5/9/19.
//  Copyright © 2019 Gerardo Osio. All rights reserved.
//

import Foundation

// MARK: - Grammar Actions Helper Functions
// These are utility functions for the grammar actions.
// These are begin used in the NavigatorListener which is the class
// that inserts an action in every each grammar rule.

extension Navigator {
    
    // MARK: - Scope
    
    func getVariable(name: String) -> Variable? {
        
        // Look in the current function
        if let variable = currentFunction.getVariable(name: name) {
            return variable
        }
        
        // Lastly check in the global variables
        return globalFunction.getVariable(name: name)
    }
    
    func getDataType(from: SailParser.TypeContext) -> DataType {
        if from.BOOL() != nil {
            return .bool
        } else if from.CHARACTER() != nil {
            return .character
        } else if from.FLOAT() != nil {
            return .float
        } else if from.INT() != nil {
            return .int
        } else if from.STRING() != nil {
            return .string
        }
        
        return .error
    }
    
    // MARK: - Memory Management Helper Functions
    
    func getAddress(for dataType: DataType) throws -> Int {
        
        var address: Int
        if currentFunction.isGlobal() {
            address = globalMemory.getAddress(for: dataType)
        } else {
            address = localMemory.getAddress(for: dataType)
        }
        
        if address == -1 {
            throw NavigatorError(description: "Couldn't get an address for a \(dataType.string)")
        }
        
        return address
    }
    
    func getTemporalAddress(for dataType: DataType) throws -> Int {
        
        var address: Int
        if currentFunction.isGlobal() {
            address = temporalGlobalMemory.getAddress(for: dataType)
        } else {
            address = temporalLocalMemory.getAddress(for: dataType)
        }
        
        if address == -1 {
            throw NavigatorError(description: "Couldn't get a temporal address for a \(dataType.string)")
        }
        
        return address
    }
    
    
    // MARK: - Quadruples
    
    // MARK: Generate Expression Quadruple.
    // Generate the next expression quadruple.
    // This function is being used in the expression grammar actions.
    func generateExpressionQuadruple() throws {
        
        let rightOperand = operands.popLast()!
        let rightDataType = operandDataTypes.popLast()!
        let leftOperand = operands.popLast()!
        let leftDataType = operandDataTypes.popLast()!
        
        let op = operators.popLast()!
        
        let resultDataType = SemanticCube.check(op: op, leftType: leftDataType, rightType: rightDataType)
        
        guard resultDataType != .error else {
            throw NavigatorError(type: .semantic, description: "Type mismatch")
        }
        
        // Generate a temporal address for the result operand
        let resultOperand = try getTemporalAddress(for: resultDataType)
        
        let quadruple = Quadruple(op: op, left: leftOperand, right: rightOperand, result: resultOperand)
        quadruples.append(quadruple)
        
        operands.append(resultOperand)
        operandDataTypes.append(resultDataType)
    }
    
    // MARK: - Debugging
    
    func printQuadruples() {
        
        print("")
        print("#".withCString{ String(format: "%-4s ", $0) }, "Operator".withCString{ String(format: "%-14s ", $0) }, "Left Address".withCString{ String(format: "%-14s ", $0) }, "Right Address".withCString{ String(format: "%-14s ", $0) }, "Result".withCString{ String(format: "%-14s", $0) })
        print("-------------------------------------------------------------")
        
        let emptyBlock = "_____"
        
        for quadrupleNumber in 0..<quadruples.count {
            let quadruple = quadruples[quadrupleNumber]
            let leftOperand: String = quadruple.left?.description ?? emptyBlock
            let rightOperand: String = quadruple.right?.description ?? emptyBlock
            let result: String = quadruple.result?.description ?? emptyBlock
            
            let quadrupleNumberDescription: String = String(quadrupleNumber)
            
            print(quadrupleNumberDescription.withCString{ String(format: "%-4s ", $0) }, quadruple.op.string.withCString{ String(format: "%-14s ", $0) }, leftOperand.withCString{ String(format: "%-14s ", $0) }, rightOperand.withCString{ String(format: "%-14s ", $0) }, result.withCString{ String(format: "%-14s", $0) })
        }
        print("")
    }
    
    func debugExpressions() {
        
        print("\(operands.count) Operands")
        for operand in operands {
            print(operand)
        }
        
        print("\(operandDataTypes.count) Operand Data Types")
        for type in operandDataTypes {
            print(type.string)
        }
        
        print("\(operators.count) Operators")
        for op in operators {
            print(op)
        }
    }
    
    func debugFunctions() {
        // TODO: Print functions contents
    }
    
}

