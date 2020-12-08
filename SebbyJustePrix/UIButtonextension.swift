//
//  UIButtonextension.swift
//  SebbyJustePrix
//
//  Created by DAGUIN Sébastien on 08/12/2020.
//

import UIKit


extension UIButton {
    func applyDesign() {
        self.backgroundColor = UIColor.darkGray
        self.layer.cornerRadius = self.frame.height / 2
        self.setTitleColor(UIColor.white, for: .normal)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 6
    }
    
    func pulsate()  {
        
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.6
        pulse.fromValue = 0.95
        pulse.toValue = 1
        pulse.autoreverses = true
        pulse.repeatCount = 2
        pulse.initialVelocity = 0.2
        pulse.damping = 1
        print("ok")
        layer.add(pulse, forKey: nil)
        
    }
}

