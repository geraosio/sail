//
//  EditorViewController.swift
//  Sail
//
//  Created by Gerardo Osio on 4/16/19.
//  Copyright © 2019 Gerardo Osio. All rights reserved.
//

import UIKit

class EditorViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var editorTextView: UITextView!
    @IBOutlet weak var consoleTextView: UITextView!
    @IBOutlet weak var runBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editorTextView.text =
//        """
//        var hello: String;
//
//        sail {
//            hello = "Hello World";
//            print(hello);
//        }
//        """
        """
        func hello(name: String) -> Void {
            print("Hello");
            print(name);
        }
        sail {
            hello("Bob");
        }
        """
        
//        """
//        var result: Int;
//
//        sail {
//            result = (5 + 10) * 8;
//        }
//        """
    }
    
    // MARK: - Actions
    
    @IBAction func runCode(_ sender: Any) {

        clearConsole()
        
        let (results, errors) = Navigator.shared.run(code: editorTextView.text)
        
        showOutputInConsole(results: results, errors: errors)
        
        self.view.endEditing(true)
    }
    
    // MARK: - Private Methods
    
    private func clearConsole() {
        consoleTextView.text = ""
    }
    
    private func showOutputInConsole(results: [String], errors: [NavigatorError]) {
        if errors.isEmpty {
            consoleTextView.textColor = UIColor(red: 234/255, green: 234/255, blue: 234/255, alpha: 1)
            for result in results {
                consoleTextView.text += result + "\n"
            }
            consoleTextView.text += "\n"
            printQuadruplesInConsole()
        } else {
            consoleTextView.textColor = UIColor(red: 242/255, green: 135/255, blue: 39/255, alpha: 1)
            consoleTextView.text += "\(errors.count) error(s):\n"
            for error in errors {
                consoleTextView.text += error.message + "\n\n"
            }
        }
    }
    
    private func printQuadruplesInConsole() {
        
        consoleTextView.text += "\n"
        consoleTextView.text += "".withCString{ String(format: "🔢%-2s", $0) }
        consoleTextView.text += "".withCString{ String(format: "👆%-5s ", $0) }
        consoleTextView.text += "".withCString{ String(format: "👈%-6s ", $0) }
        consoleTextView.text += "".withCString{ String(format: "👉%-6s ", $0) }
        consoleTextView.text += "".withCString{ String(format: "🤘%-5s", $0) } + "\n"
        consoleTextView.text += "----------------------------------------\n"
        
        let emptyBlock = "_____"
        
        for quadrupleNumber in 0..<Navigator.shared.quadruples.count {
            let quadruple = Navigator.shared.quadruples[quadrupleNumber]
            let leftOperand: String = quadruple.left?.description ?? emptyBlock
            let rightOperand: String = quadruple.right?.description ?? emptyBlock
            let result: String = quadruple.result?.description ?? emptyBlock
            
            let quadrupleNumberDescription: String = String(quadrupleNumber)
            
            consoleTextView.text += quadrupleNumberDescription.withCString{ String(format: "%-3s ", $0) }
            consoleTextView.text += quadruple.op.string.withCString{ String(format: "%-8s ", $0) }
            consoleTextView.text += leftOperand.withCString{ String(format: "%-8s ", $0) }
            consoleTextView.text += rightOperand.withCString{ String(format: "%-8s ", $0) }
            consoleTextView.text += result.withCString{ String(format: "%-8s", $0) } + "\n"
        }
        consoleTextView.text += "\n"
    }
    
}
