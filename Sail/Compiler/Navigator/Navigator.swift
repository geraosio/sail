//
//  Navigator.swift
//  Sail
//
//  Created by Gerardo Osio on 4/20/19.
//  Copyright © 2019 Gerardo Osio. All rights reserved.
//

import Foundation
import Antlr4

class Navigator {

    // MARK: - Singleton
    // There will only be an instance of Navigator to access it from every class in the app.
    static let shared = Navigator()
    
    
    
    // MARK: - Properties
    
    // MARK: Output
    var results: [String]!
    var errors: [NavigatorError]!
    
    // MARK: Compilation
    var currentFunction: Function!
    var globalFunction: Function!
    var functionTable: [String: Function]!
    
    // MARK: Code Generation
    var quadruples: [Quadruple]!
    var temporalCounter: Int!
    var variableCounter: Int!
    
    // MARK: Expression Stacks
    var operands: [Int]!                // PilaO
    var operandDataTypes: [DataType]!   // PTypes
    var operators: [Operator]!          // POper
    
    
    
    // MARK: - Initializers

    init() {
    }
    
    
    
    // MARK: - Methods
    
    func run(code: String) {
        do {
            reset()
            
            let lexer = SailLexer(ANTLRInputStream(code))   // Create the lexer
            let tokens = CommonTokenStream(lexer)           // Create a buffer of tokens from lexer
            let parser = try SailParser(tokens)             // Create a parser that feeds of the tokens buffer
            
            // Remove default error listeners to be able to catch parsing errors
            parser.removeErrorListeners()
            parser.addErrorListener(NavigatorErrorListener())
            
            let tree = try parser.program()

            let walker = ParseTreeWalker()
            let listener = NavigatorListener()              // Using custom Listener
            try walker.walk(listener, tree)
        } catch {
            let unexpectedError = NavigatorError(description: "Unexpected error: \(error.localizedDescription)")
            errors.append(unexpectedError)
        }
    }
    
    // MARK: Private Methods
    
    private func reset() {
        results = []
        errors = []
        
        functionTable = [:]     // Also works as the scope
        
        quadruples = []
        temporalCounter = 0
        variableCounter = 100
        
        operands = []
        operandDataTypes = []
        operators = []
    }
    
}

// MARK: - Grammar Actions Helper Functions
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
    
    
    
    // MARK: - Quadruples
    
    func generateExpressionQuadruple() throws {
        print("Entered generating expression quad")
        
        let rightOperand = operands.popLast()
        let rightDataType = operandDataTypes.popLast()
        let leftOperand = operands.popLast()
        let leftDataType = operandDataTypes.popLast()
        
        let op = operators.popLast()!
        
        let resultDataType = SemanticCube.check(op: op, leftType: leftDataType!, rightType: rightDataType!)
        
        guard resultDataType != .error else {
            throw NavigatorError(type: .semantic, description: "Type mismatch")
        }
        
        let resultOperand = temporalCounter + 1 // TODO: Memory - Generate a temporal address for the result operand
        let quadruple = Quadruple(op: op, left: leftOperand, right: rightOperand, result: resultOperand)
        quadruples.append(quadruple)
        
        operands.append(resultOperand)
        operandDataTypes.append(resultDataType)
        
        // TODO: Memory - If any operand had a temporal space, return space to available
    }
    
    func printQuadruples() {
        for quadruple in quadruples {
            let emptyBlock = "______"
            let quadLeft: String
            let quadRight: String
            let quadResult: String
            
            if let left = quadruple.left {
                quadLeft = String(left)
            } else {
                quadLeft = emptyBlock
            }
            
            if let right = quadruple.right {
                quadRight = String(right)
            } else {
                quadRight = emptyBlock
            }
            
            if let result = quadruple.result {
                quadResult = String(result)
            } else {
                quadResult = emptyBlock
            }
            
            print("Operator \t Left \t Right Address \t Result Address")
            print("\(quadruple.op) \t \(quadLeft) \t \(quadRight) \t \(quadResult)")
        }
    }
    
}
