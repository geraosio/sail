//
//  EditorViewController.swift
//  Sail
//
//  Created by Gerardo Osio on 4/16/19.
//  Copyright © 2019 Gerardo Osio. All rights reserved.
//

import UIKit
import Antlr4

class EditorViewController: UIViewController {

    @IBOutlet weak var editorTextView: UITextView!
    @IBOutlet weak var consoleTextView: UITextView!
    @IBOutlet weak var runBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func runCode(_ sender: Any) {
        do {
            clearConsole()
            
            let lexer = SailLexer(ANTLRInputStream(editorTextView.text)) // Create the lexer
            let tokens = CommonTokenStream(lexer) // Create a buffer of tokens from lexer
            let parser = try SailParser(tokens) // Create a parser that feeds of the tokens buffer
            parser.removeErrorListeners()
            parser.addErrorListener(VerboseErrorListener())
            let tree = try parser.program()
            
            let walker = ParseTreeWalker()
            let listener = SailBaseListener()
            try walker.walk(listener, tree)
            
            printParseErrorMessages(to: consoleTextView)
        } catch {
            consoleTextView.text = "Parse error: \(error.localizedDescription)"
        }
        
        self.view.endEditing(true)
    }
    
    private func clearConsole() {
        consoleTextView.text = ""
        VerboseErrorListener.errorMessagesStack.removeAll()
    }
    
    private func printParseErrorMessages(to textView: UITextView) {
        if VerboseErrorListener.errorMessagesStack.isEmpty {
            consoleTextView.textColor = UIColor(red: 234/255, green: 234/255, blue: 234/255, alpha: 1)
            consoleTextView.text += "🎉\n"
        } else {
            consoleTextView.textColor = UIColor(red: 242/255, green: 135/255, blue: 39/255, alpha: 1)
            consoleTextView.text += "\(VerboseErrorListener.errorMessagesStack.count) parsing error(s):\n"
            for errorMessage in VerboseErrorListener.errorMessagesStack {
                consoleTextView.text += errorMessage + "\n"
            }
        }
    }
    
}
