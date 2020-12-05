//
//  ViewController.swift
//  SebbyJustePrix
//
//  Created by DAGUIN Sébastien on 01/12/2020.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    let price = Int.random(in: 0...500)
    
    func justePrix(priceChoice : Int) -> Bool {
        print("ok")
        if priceChoice > price {
            displayPrice.text = "C'est moins"
            return false
        }
        else if priceChoice < price {
            displayPrice.text = "C'est plus"
            return false
        }
        else {
            displayPrice.text = "Vous avez gagner"
            return true
        }
    }
    
    @IBOutlet weak var displayPrice: UILabel!
    
    @IBOutlet weak var uPrice: UITextField!
    
    @IBAction func congratButton(_ sender: Any) {
        print("Apuuie Second")
        
    }
    
    @IBAction func uValidatePrice(_ sender: Any) {
        
        print(price)
        let priceUser = Int(uPrice.text ?? "") ?? 0
        justePrix(priceChoice: priceUser)
        uPrice.text = ""
        if justePrix(priceChoice: priceUser) == true {
            uPrice.resignFirstResponder()
            self.performSegue(withIdentifier: "SecondViewsSegue", sender: self)
        }
    }
   
    
        
    
}

