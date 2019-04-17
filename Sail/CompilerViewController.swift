//
//  CompilerViewController.swift
//  Sail
//
//  Created by Gerardo Osio on 4/16/19.
//  Copyright © 2019 Gerardo Osio. All rights reserved.
//

import UIKit

class CompilerViewController: UIViewController {

    @IBOutlet weak var codeTextView: UITextView!
    @IBOutlet weak var consoleTextView: UITextView!
    @IBOutlet weak var runBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func runCode(_ sender: Any) {
        consoleTextView.text = "Code ran!"
        self.view.endEditing(true)
    }
    
}
