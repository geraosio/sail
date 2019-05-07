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
        
        globalFunction = Function(name: "sail")
        currentFunction = globalFunction
        functionTable = [:]
        functionTable[globalFunction.name] = globalFunction
        
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
    }
    
    // MARK: - Debugging
    
    func printQuadruples() {
        
        print("#".withCString{ String(format: "%-4s ", $0) }, "Operator".withCString{ String(format: "%-14s ", $0) }, "Left Address".withCString{ String(format: "%-14s ", $0) }, "Right Address".withCString{ String(format: "%-14s ", $0) }, "Result".withCString{ String(format: "%-14s", $0) })
        print("-------------------------------------------------------------")
        
        let emptyBlock = "_____"
        
        for quadrupleNumber in 0 ..< quadruples.count {
            let quadruple = quadruples[quadrupleNumber]
            let leftOperand: String = quadruple.left?.description ?? emptyBlock
            let rightOperand: String = quadruple.right?.description ?? emptyBlock
            let result: String = quadruple.result?.description ?? emptyBlock
            
            let quadrupleNumberDescription: String = String(quadrupleNumber)
            
            print(quadrupleNumberDescription.withCString{ String(format: "%-4s ", $0) }, quadruple.op.string.withCString{ String(format: "%-14s ", $0) }, leftOperand.withCString{ String(format: "%-14s ", $0) }, rightOperand.withCString{ String(format: "%-14s ", $0) }, result.withCString{ String(format: "%-14s", $0) })
        }
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
