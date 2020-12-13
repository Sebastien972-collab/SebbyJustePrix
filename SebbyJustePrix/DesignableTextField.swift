//
//  DesignableTextField.swift
//  SebbyJustePrix
//
//  Created by DAGUIN Sébastien on 09/12/2020.
//

import UIKit
@IBDesignable

class DesignableTextField : UITextField {
    
    @IBInspectable var leftImage : UIImage? {
        didSet{
            
        }
    }
    func updateView() {
        if let image = leftImage {
            leftViewMode = .always
            let imageView = UIImage
            
        }
    }
}
