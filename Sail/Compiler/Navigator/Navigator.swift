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
    
    // MARK: Expression Stacks
    var operands: [Int]!                // PilaO
    var operandDataTypes: [DataType]!   // PTypes
    var operators: [Operator]!          // POper
    
    // MARK: Code Generation
    var quadruples: [Quadruple]!
    
    // MARK: Memory
    
    // MARK: Memory Base Addresses
    let constantsBaseAddress        = 0
    let globalBaseAddress           = 20_000
    let localBaseAddress            = 40_000
    let temporalGloablBaseAddress   = 60_000
    let temporalLocalBaseAddress    = 80_000
    
    var constantsMemory: Memory!
    var globalMemory: Memory!
    var localMemory: Memory!
    var temporalGlobalMemory: Memory!
    var temporalLocalMemory: Memory!
    
    
    
    // MARK: - Initializers

    init() {
        constantsMemory = Memory(baseAddress: constantsBaseAddress)
        globalMemory = Memory(baseAddress: globalBaseAddress)
        localMemory = Memory(baseAddress: localBaseAddress)
        temporalGlobalMemory = Memory(baseAddress: temporalGloablBaseAddress)
        temporalLocalMemory = Memory(baseAddress: temporalLocalBaseAddress)
    }
    
    
    
    // MARK: - Methods
    
    func run(code: String) {
        do {
            clear()
            
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
    
    private func clear() {
        results = []
        errors = []
        
        functionTable = [:]     // Also works as the scope
        
        operands = []
        operandDataTypes = []
        operators = []
        
        quadruples = []
        
        constantsMemory.clear()
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
    
    func generateExpressionQuadruple() throws {
        print("Entered generating expression quad")
        
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
        
        // TODO: Memory - If any of the operands had a temporal space release it
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
