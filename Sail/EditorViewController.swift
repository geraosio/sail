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
        sail {
            if (5 * 2 == 10) {
                print("end");
            }
            x = 4 / 5 + 2;
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
        } else {
            consoleTextView.textColor = UIColor(red: 242/255, green: 135/255, blue: 39/255, alpha: 1)
            consoleTextView.text += "\(Navigator.shared.errors.count) error(s):\n"
            for error in Navigator.shared.errors {
                consoleTextView.text += error.message + "\n"
            }
        }
    }
    
}
