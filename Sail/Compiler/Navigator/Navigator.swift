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
    
    // MARK: Code Generation Stacks
    var operands: [Int]!                // PilaO as seen in class
    var operandDataTypes: [DataType]!   // PTypes as seen in class
    var operators: [Operator]!          // POper as seen in class
    var jumps: [Int]!                   // PJumps as seen in class
    
    // MARK: Code Generation
    var quadruples: [Quadruple]!
    var parameterCounter: Int!
    
    // MARK: Memory Base Addresses
    let functionsBaseAddress        = 0
    let constantsBaseAddress        = 20_000
    let globalBaseAddress           = 40_000
    let localBaseAddress            = 60_000
    let temporalGloablBaseAddress   = 80_000
    let temporalLocalBaseAddress    = 100_000
    
    // MARK: Memory
    var constantsMemory: Memory!
    var globalMemory: Memory!
    var localMemory: Memory!
    var temporalGlobalMemory: Memory!
    var temporalLocalMemory: Memory!
    
    // MARK: Virtual Machine
    var savedMemories: [Memory]!
    var calledFunctionsAddresses: [Int]!
    var runtimeFunctionLocalMemory: Memory!
    var runtimeFunctionTemporalMemory: Memory!
    
    
    
    // MARK: - Initializers

    init() {
        constantsMemory = Memory(baseAddress: constantsBaseAddress)
        globalMemory = Memory(baseAddress: globalBaseAddress)
        localMemory = Memory(baseAddress: localBaseAddress)
        temporalGlobalMemory = Memory(baseAddress: temporalGloablBaseAddress)
        temporalLocalMemory = Memory(baseAddress: temporalLocalBaseAddress)
    }
    
    
    
    // MARK: - Methods
    
    func run(code: String) -> ([String], [NavigatorError]) {
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
        
        return (Navigator.shared.results, Navigator.shared.errors)
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
        jumps = []
        
        quadruples = []
        
        constantsMemory.clear()
        globalMemory.clear()
        localMemory.clear()
        temporalGlobalMemory.clear()
        temporalLocalMemory.clear()
        
        savedMemories = []
        calledFunctionsAddresses = []
    }
    
}

// MARK: - Virtual Machine
extension Navigator {
    
    // MARK: - Utilities
    
    func getValue(inAddress address: Int) -> (Any, DataType) {
        switch address {
        case ..<0:
            // Array addresses
            let (arrayAddress, _) = getValue(inAddress: -address)
            return getValue(inAddress: arrayAddress as! Int)
        case ..<constantsBaseAddress:
            // Functions
            let function = functionTable.values.first { (function) -> Bool in function.address == address }
            let returnAddress = globalFunction.getVariable(name: (function?.name)!)?.address
            return getValue(inAddress: returnAddress!)
        case ..<globalBaseAddress:
            // Constants
            return constantsMemory.getValue(inAddress: address)
        case ..<localBaseAddress:
            // Globals
            return globalMemory.getValue(inAddress: address)
        case ..<temporalGloablBaseAddress:
            // Locals
            return localMemory.getValue(inAddress: address)
        case ..<temporalLocalBaseAddress:
            // Temporal Global
            return temporalGlobalMemory.getValue(inAddress: address)
        default:
            // Temporal Local
            return temporalLocalMemory.getValue(inAddress: address)
        }
    }
    
    func saveInMemory(value: Any, inAddress address: Int) {
        switch address {
        case ..<0:
            // Array addresses
            let (arrayAddress, _) = getValue(inAddress: -address)
            saveInMemory(value: value, inAddress: arrayAddress as! Int)
        case ..<constantsBaseAddress:
            // Functions
            let function = functionTable.values.first { (function) -> Bool in function.address == address }
            let returnAddress = globalFunction.getVariable(name: (function?.name)!)?.address
            saveInMemory(value: value, inAddress: returnAddress!)
        case ..<globalBaseAddress:
            // Constants
            constantsMemory.save(value: value, inAddress: address)
        case ..<localBaseAddress:
            // Globals
            globalMemory.save(value: value, inAddress: address)
        case ..<temporalGloablBaseAddress:
            // Locals
            localMemory.save(value: value, inAddress: address)
        case ..<temporalLocalBaseAddress:
            // Temporal Global
            temporalGlobalMemory.save(value: value, inAddress: address)
        default:
            // Temporal Local
            temporalLocalMemory.save(value: value, inAddress: address)
        }
    }
    
    // MARK: - Sail through quadruples
    
    func sail() {
        
        // Will be the pointer of the current quadruple
        var sailIndex = 0
        
        // Clear and reuse Local, Global, TemporalLocal and TemporalGlobal Memories for execution
        globalMemory.clear()
        localMemory.clear()
        temporalGlobalMemory.clear()
        temporalLocalMemory.clear()
        
        // Start the Memories' addresses with nil to be able to add the calculated values in their respective addresses
        globalMemory.allocate()
        localMemory.allocate()
        temporalGlobalMemory.allocate()
        temporalLocalMemory.allocate()
        
        // Start executing each operation
        while sailIndex < quadruples.count {
            
            let quadruple = quadruples[sailIndex]
            
            switch quadruple.op {
            // MARK: - Addition
            case .addition:
                let (leftValue, leftType) = getValue(inAddress: quadruple.left!)
                let (rightValue, rightType) = getValue(inAddress: quadruple.right!)
                
                switch (leftType, rightType) {
                case (.int, .int):
                    saveInMemory(value: (leftValue as! Int) + (rightValue as! Int), inAddress: quadruple.result!)
                case (.int, .float):
                    saveInMemory(value: Float(leftValue as! Int) + (rightValue as! Float), inAddress: quadruple.result!)
                case (.float, .int):
                    saveInMemory(value: (leftValue as! Float) + Float(rightValue as! Int), inAddress: quadruple.result!)
                case (.float, .float):
                    saveInMemory(value: (leftValue as! Float) + (rightValue as! Float), inAddress: quadruple.result!)
                default:
                    break
                }
            // MARK: - Subtraction
            case .subtraction:
                let (leftValue, leftType) = getValue(inAddress: quadruple.left!)
                let (rightValue, rightType) = getValue(inAddress: quadruple.right!)
                
                switch (leftType, rightType) {
                case (.int, .int):
                    saveInMemory(value: (leftValue as! Int) - (rightValue as! Int), inAddress: quadruple.result!)
                case (.int, .float):
                    saveInMemory(value: Float(leftValue as! Int) - (rightValue as! Float), inAddress: quadruple.result!)
                case (.float, .int):
                    saveInMemory(value: (leftValue as! Float) - Float(rightValue as! Int), inAddress: quadruple.result!)
                case (.float, .float):
                    saveInMemory(value: (leftValue as! Float) - (rightValue as! Float), inAddress: quadruple.result!)
                default:
                    break
                }
            // MARK: - Multiplication
            case .multiplication:
                let (leftValue, leftType) = getValue(inAddress: quadruple.left!)
                let (rightValue, rightType) = getValue(inAddress: quadruple.right!)
                
                switch (leftType, rightType) {
                case (.int, .int):
                    saveInMemory(value: (leftValue as! Int) + (rightValue as! Int), inAddress: quadruple.result!)
                case (.int, .float):
                    saveInMemory(value: Float(leftValue as! Int) + (rightValue as! Float), inAddress: quadruple.result!)
                case (.float, .int):
                    saveInMemory(value: (leftValue as! Float) + Float(rightValue as! Int), inAddress: quadruple.result!)
                case (.float, .float):
                    saveInMemory(value: (leftValue as! Float) + (rightValue as! Float), inAddress: quadruple.result!)
                default:
                    break
                }
            // MARK: - Division
            case .division:
                let (leftValue, leftType) = getValue(inAddress: quadruple.left!)
                let (rightValue, rightType) = getValue(inAddress: quadruple.right!)
                
                switch (leftType, rightType) {
                case (.int, .int):
                    saveInMemory(value: (leftValue as! Int) / (rightValue as! Int), inAddress: quadruple.result!)
                case (.int, .float):
                    saveInMemory(value: Float(leftValue as! Int) / (rightValue as! Float), inAddress: quadruple.result!)
                case (.float, .int):
                    saveInMemory(value: (leftValue as! Float) / Float(rightValue as! Int), inAddress: quadruple.result!)
                case (.float, .float):
                    saveInMemory(value: (leftValue as! Float) / (rightValue as! Float), inAddress: quadruple.result!)
                default:
                    break
                }
            // MARK: - And
            case .and:
                let (leftValue, _) = getValue(inAddress: quadruple.left!)
                let (rightValue, _) = getValue(inAddress: quadruple.right!)
                
                saveInMemory(value: (leftValue as! Bool) && (rightValue as! Bool), inAddress: quadruple.result!)
            // MARK: - Or
            case .or:
                let (leftValue, _) = getValue(inAddress: quadruple.left!)
                let (rightValue, _) = getValue(inAddress: quadruple.right!)
                
                saveInMemory(value: (leftValue as! Bool) || (rightValue as! Bool), inAddress: quadruple.result!)
            // MARK: - Not
            case .not:
                break
            // MARK: - Equal
            case .equal:
                let (leftValue, leftType) = getValue(inAddress: quadruple.left!)
                let (rightValue, rightType) = getValue(inAddress: quadruple.right!)
                
                switch (leftType, rightType) {
                case (.int, .int):
                    saveInMemory(value: (leftValue as! Int) == (rightValue as! Int), inAddress: quadruple.result!)
                case (.int, .float):
                    saveInMemory(value: Float(leftValue as! Int) == (rightValue as! Float), inAddress: quadruple.result!)
                case (.float, .int):
                    saveInMemory(value: (leftValue as! Float) == Float(rightValue as! Int), inAddress: quadruple.result!)
                case (.float, .float):
                    saveInMemory(value: (leftValue as! Float) == (rightValue as! Float), inAddress: quadruple.result!)
                case (.character, .character):
                    saveInMemory(value: (leftValue as! Character) == (rightValue as! Character), inAddress: quadruple.result!)
                case (.character, .string):
                    saveInMemory(value: String(leftValue as! Character) == (rightValue as! String), inAddress: quadruple.result!)
                case (.string, .character):
                    saveInMemory(value: (leftValue as! String) == String(rightValue as! Character), inAddress: quadruple.result!)
                case (.string, .string):
                    saveInMemory(value: (leftValue as! String) == (rightValue as! String), inAddress: quadruple.result!)
                case (.bool, .bool):
                    saveInMemory(value: (leftValue as! Bool) == (rightValue as! Bool), inAddress: quadruple.result!)
                default:
                    break
                }
            // MARK: - Not Equal
            case .notEqual:
                let (leftValue, leftType) = getValue(inAddress: quadruple.left!)
                let (rightValue, rightType) = getValue(inAddress: quadruple.right!)
                
                switch (leftType, rightType) {
                case (.int, .int):
                    saveInMemory(value: (leftValue as! Int) != (rightValue as! Int), inAddress: quadruple.result!)
                case (.int, .float):
                    saveInMemory(value: Float(leftValue as! Int) != (rightValue as! Float), inAddress: quadruple.result!)
                case (.float, .int):
                    saveInMemory(value: (leftValue as! Float) != Float(rightValue as! Int), inAddress: quadruple.result!)
                case (.float, .float):
                    saveInMemory(value: (leftValue as! Float) != (rightValue as! Float), inAddress: quadruple.result!)
                case (.character, .character):
                    saveInMemory(value: (leftValue as! Character) != (rightValue as! Character), inAddress: quadruple.result!)
                case (.character, .string):
                    saveInMemory(value: String(leftValue as! Character) != (rightValue as! String), inAddress: quadruple.result!)
                case (.string, .character):
                    saveInMemory(value: (leftValue as! String) != String(rightValue as! Character), inAddress: quadruple.result!)
                case (.string, .string):
                    saveInMemory(value: (leftValue as! String) != (rightValue as! String), inAddress: quadruple.result!)
                case (.bool, .bool):
                    saveInMemory(value: (leftValue as! Bool) != (rightValue as! Bool), inAddress: quadruple.result!)
                default:
                    break
                }
            // MARK: - Greater Than
            case .greater:
                let (leftValue, leftType) = getValue(inAddress: quadruple.left!)
                let (rightValue, rightType) = getValue(inAddress: quadruple.right!)
                
                switch (leftType, rightType) {
                case (.int, .int):
                    saveInMemory(value: (leftValue as! Int) > (rightValue as! Int), inAddress: quadruple.result!)
                case (.int, .float):
                    saveInMemory(value: Float(leftValue as! Int) > (rightValue as! Float), inAddress: quadruple.result!)
                case (.float, .int):
                    saveInMemory(value: (leftValue as! Float) > Float(rightValue as! Int), inAddress: quadruple.result!)
                case (.float, .float):
                    saveInMemory(value: (leftValue as! Float) > (rightValue as! Float), inAddress: quadruple.result!)
                default:
                    break
                }
            // MARK: - Less Than
            case .less:
                let (leftValue, leftType) = getValue(inAddress: quadruple.left!)
                let (rightValue, rightType) = getValue(inAddress: quadruple.right!)
                
                switch (leftType, rightType) {
                case (.int, .int):
                    saveInMemory(value: (leftValue as! Int) < (rightValue as! Int), inAddress: quadruple.result!)
                case (.int, .float):
                    saveInMemory(value: Float(leftValue as! Int) < (rightValue as! Float), inAddress: quadruple.result!)
                case (.float, .int):
                    saveInMemory(value: (leftValue as! Float) < Float(rightValue as! Int), inAddress: quadruple.result!)
                case (.float, .float):
                    saveInMemory(value: (leftValue as! Float) < (rightValue as! Float), inAddress: quadruple.result!)
                default:
                    break
                }
            // MARK: - Greater Than or Equal
            case .greaterEqual:
                let (leftValue, leftType) = getValue(inAddress: quadruple.left!)
                let (rightValue, rightType) = getValue(inAddress: quadruple.right!)
                
                switch (leftType, rightType) {
                case (.int, .int):
                    saveInMemory(value: (leftValue as! Int) >= (rightValue as! Int), inAddress: quadruple.result!)
                case (.int, .float):
                    saveInMemory(value: Float(leftValue as! Int) >= (rightValue as! Float), inAddress: quadruple.result!)
                case (.float, .int):
                    saveInMemory(value: (leftValue as! Float) >= Float(rightValue as! Int), inAddress: quadruple.result!)
                case (.float, .float):
                    saveInMemory(value: (leftValue as! Float) >= (rightValue as! Float), inAddress: quadruple.result!)
                default:
                    break
                }
            // MARK: - Less Than or Equal
            case .lessEqual:
                let (leftValue, leftType) = getValue(inAddress: quadruple.left!)
                let (rightValue, rightType) = getValue(inAddress: quadruple.right!)
                
                switch (leftType, rightType) {
                case (.int, .int):
                    saveInMemory(value: (leftValue as! Int) <= (rightValue as! Int), inAddress: quadruple.result!)
                case (.int, .float):
                    saveInMemory(value: Float(leftValue as! Int) <= (rightValue as! Float), inAddress: quadruple.result!)
                case (.float, .int):
                    saveInMemory(value: (leftValue as! Float) <= Float(rightValue as! Int), inAddress: quadruple.result!)
                case (.float, .float):
                    saveInMemory(value: (leftValue as! Float) <= (rightValue as! Float), inAddress: quadruple.result!)
                default:
                    break
                }
            // MARK: - False Bottom
            case .falseBottom:
                break
            // MARK: - Print
            case .print:
                let (resultValue, _) = getValue(inAddress: quadruple.result!)
                results.append("\(resultValue)")
            // MARK: - Assign
            case .assign:
                let (leftValue, _) = getValue(inAddress: quadruple.left!)
                saveInMemory(value: leftValue, inAddress: quadruple.result!)
            // MARK: - Goto
            case .goto:
                sailIndex = quadruple.result! - 1
            // MARK: - GotoF
            case .gotoFalse:
                sailIndex = quadruple.result! - 1
            // MARK: - GotoT
            case .gotoTrue:
                sailIndex = quadruple.result! - 1
            // MARK: - ERA
            case .era:
                // Save in stack in the case there's nesting in function calls
                calledFunctionsAddresses.append(quadruple.result!)
                
                // Create new Memorys with the Local and Local Temporal Memorys' baseAddress and addressSize
                runtimeFunctionLocalMemory = Memory(baseAddress: localMemory.baseAddress, addressSize: localMemory.addressSize)
                runtimeFunctionTemporalMemory = Memory(baseAddress: temporalLocalMemory.baseAddress, addressSize: temporalLocalMemory.addressSize)
                
                // Set all addresses to nil
                runtimeFunctionLocalMemory.allocate()
                runtimeFunctionTemporalMemory.allocate()
            // MARK: - Parameter
            case .parameter:
                
            // MARK: - GoSub
            case .gosub:
                
            // MARK: - Return
            case .returnValue:
                
            // MARK: - EndFunc
            case .endFunction:
                
            case .verify:
                let (indexValue, _) = getValue(inAddress: quadruple.result!)
                
                if (indexValue as! Int) >= quadruple.right! {
                    let error = NavigatorError(type: .runtime, atLine: nil, positionInLine: nil, description: "Array index out of bounds. Trying to access index larger than it's size")
                    errors.append(error)
                    sailIndex = quadruples.count
                }
            case .end:
                sailIndex = quadruples.count
            default:
                break
            }
            
            sailIndex += 1
        }
    }
}
