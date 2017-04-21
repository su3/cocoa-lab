//
//  stepperNumberFormatter.swift
//  StepperDemo
//
//  Created by Su Xiaozhou on 21/04/2017.
//  Copyright © 2017 Su Xiaozhou. All rights reserved.
//

import Cocoa

class stepperNumberFormatter: NumberFormatter {
    override func isPartialStringValid(_ partialString: String, newEditingString newString: AutoreleasingUnsafeMutablePointer<NSString?>?, errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>?) -> Bool {
        if partialString.isEmpty {
            return true
        }
        return Int(partialString) != nil
    }
}
