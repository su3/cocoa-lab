//
//  ViewController.swift
//  StepperDemo
//
//  Created by Su Xiaozhou on 21/04/2017.
//  Copyright © 2017 Su Xiaozhou. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var textField: NSTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.formatter = stepperNumberFormatter()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

