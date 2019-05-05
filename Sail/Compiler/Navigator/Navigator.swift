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
    var errors: [String]!
    
    // MARK: Compilation
    var functionTable: [String: Function]!
    var globalVariables: [String: Variable]!

    
    
    // MARK: - Initializers

    init() {
        errors = []
        
        functionTable = [:]     // Also works as the scope
        globalVariables = [:]
    }

    
    
    // MARK: - Methods
    
    func run(code: String) {
        do {
            let lexer = SailLexer(ANTLRInputStream(code)) // Create the lexer
            let tokens = CommonTokenStream(lexer) // Create a buffer of tokens from lexer
            let parser = try SailParser(tokens) // Create a parser that feeds of the tokens buffer
            // Remove default error listeners to be able to catch parsing errors
            parser.removeErrorListeners()
            parser.addErrorListener(NavigatorErrorListener())
            let tree = try parser.program()

            let walker = ParseTreeWalker()
            let listener = SailBaseListener()
            try walker.walk(listener, tree)
        } catch {
            errors.append("Error: \(error.localizedDescription)")
        }
    }
    
}
