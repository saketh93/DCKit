//
//  MandatoryNumberTextField.swift
//  DCKit
//
//  Created by Andrey Gordeev on 11/03/15.
//  Copyright (c) 2015 Andrey Gordeev (andrew8712@gmail.com). All rights reserved.
//

import UIKit

/// Allows to set a max possible value.
public class DCMandatoryNumberTextField: DCMandatoryTextField {
    
    @IBInspectable public var maxValue: Float = 999
    
    // MARK: - Initializers
    
    // IBDesignables require both of these inits, otherwise we'll get an error: IBDesignable View Rendering times out.
    // http://stackoverflow.com/questions/26772729/ibdesignable-view-rendering-times-out
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Build control
    
    override public func customInit() {
        super.customInit()
        keyboardType = UIKeyboardType.decimalPad
    }
    
    // MARK: - Validation
    
    override public func isValid() -> Bool {
        var valid = true

        if let value = Float(text ?? "") {
            valid = value < maxValue
        }
        else {
            // If the field is Mandatory and empty - it's invalid
            valid = !isMandatory
        }

        isSelected = !valid
        return valid
    }
    
}
