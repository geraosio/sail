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
        """
        var x: Int;

        func addOne(a: Int) -> Int {
            return a + 1;
        }

        func printInt(a: Int) -> Void {
            print(a);
        }

        sail {
            x = 1;
            while (x < 5) {
                x = addOne(x);
            }
            x = 4 / 5 + 2;
            printInt(x);
        }
        """
    }
    
    // MARK: - Actions
    
    @IBAction func runCode(_ sender: Any) {

        clearConsole()
        
        Navigator.shared.run(code: editorTextView.text)
        
        showMessagesInConsole()
        
        self.view.endEditing(true)
    }
    
    // MARK: - Private Methods
    
    private func clearConsole() {
        consoleTextView.text = ""
    }
    
    private func showMessagesInConsole() {
        if Navigator.shared.errors.isEmpty {
            consoleTextView.textColor = UIColor(red: 234/255, green: 234/255, blue: 234/255, alpha: 1)
            consoleTextView.text += "🎉\n"
            printQuadruplesInConsole()
        } else {
            consoleTextView.textColor = UIColor(red: 242/255, green: 135/255, blue: 39/255, alpha: 1)
            consoleTextView.text += "\(Navigator.shared.errors.count) error(s):\n"
            for error in Navigator.shared.errors {
                consoleTextView.text += error.message + "\n"
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
        
        for quadrupleNumber in 0 ..< Navigator.shared.quadruples.count {
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
