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
    @IBOutlet weak var showQuadruplesBarButton: UIBarButtonItem!
    
    
    
    // MARK: - Lifecycle Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showQuadruplesBarButton.isEnabled = false
        
        editorTextView.text =
        """
        var result: Int;
        var i: Int;

        func factorial(n: Int) -> Int {
            result = 1;
            i = 1;

            while(i <= n) {
                result = result * i;
                i = i + 1;
            }

            return result;
        }



        sail {
            print(factorial(5));
        }
        """
    }
    
    
    
    // MARK: - Actions
    
    @IBAction func runCode(_ sender: Any) {

        clearConsole()
        
        let (results, errors) = Navigator.shared.run(code: editorTextView.text)
        
        showOutputInConsole(results: results, errors: errors)
        
        showQuadruplesBarButton.isEnabled = true
        
        self.view.endEditing(true)
    }
    
    
    @IBAction func showQuadruplesInConsole(_ sender: Any) {
        consoleTextView.text = getQuadruplesOutput()
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
        } else {
            consoleTextView.textColor = UIColor(red: 242/255, green: 135/255, blue: 39/255, alpha: 1)
            consoleTextView.text += "\(errors.count) error(s):\n"
            for error in errors {
                consoleTextView.text += error.message + "\n\n"
            }
        }
    }
    
    private func getQuadruplesOutput() -> String {
        
        var quadruplesOutput: String = ""
        
        quadruplesOutput += "".withCString{ String(format: "🔢%-2s", $0) }
        quadruplesOutput += "".withCString{ String(format: "👆%-5s ", $0) }
        quadruplesOutput += "".withCString{ String(format: "👈%-6s ", $0) }
        quadruplesOutput += "".withCString{ String(format: "👉%-6s ", $0) }
        quadruplesOutput += "".withCString{ String(format: "🤘%-5s", $0) } + "\n"
        quadruplesOutput += "----------------------------------------\n"
        
        let emptyBlock = "_____"
        
        for quadrupleNumber in 0..<Navigator.shared.quadruples.count {
            let quadruple = Navigator.shared.quadruples[quadrupleNumber]
            let leftOperand: String = quadruple.left?.description ?? emptyBlock
            let rightOperand: String = quadruple.right?.description ?? emptyBlock
            let result: String = quadruple.result?.description ?? emptyBlock
            
            let quadrupleNumberDescription: String = String(quadrupleNumber)
            
            quadruplesOutput += quadrupleNumberDescription.withCString{ String(format: "%-3s ", $0) }
            quadruplesOutput += quadruple.op.string.withCString{ String(format: "%-8s ", $0) }
            quadruplesOutput += leftOperand.withCString{ String(format: "%-8s ", $0) }
            quadruplesOutput += rightOperand.withCString{ String(format: "%-8s ", $0) }
            quadruplesOutput += result.withCString{ String(format: "%-8s", $0) } + "\n"
        }
        
        return quadruplesOutput
    }
    
}
