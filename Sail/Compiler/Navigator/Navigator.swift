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
    var savedRuntimeQuadrupleIndices: [Int]!
    var savedFunctionsAddresses: [Int]!
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
        savedRuntimeQuadrupleIndices = []
        savedFunctionsAddresses = []
    }
    
}
