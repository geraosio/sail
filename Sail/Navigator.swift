//
//  Navigator.swift
//  Sail
//
//  Created by Gerardo Osio on 4/20/19.
//  Copyright © 2019 Gerardo Osio. All rights reserved.
//

import Foundation
import Antlr4

// Controls compilation process

class Navigator {

    // MARK: - Singleton
    static let shared = Navigator()

    // MARK: - Properties

    var errors: [String]!

    // MARK: - Initializers

    init() {
        errors = []
    }

    // MARK: - Compile Function

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
    
    // MARK: - Base Listener Helper Functions
    
    
}
