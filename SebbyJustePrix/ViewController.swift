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
    
    func justePrix(priceChoice : Int) {
        print("ok")
        if priceChoice > price {
            displayPrice.text = "C'est moins"
        }
        else if priceChoice < price {
            displayPrice.text = "C'est plus"
        }
        else {
            displayPrice.text = "Vous avez gagner"
        }
    }
    
    @IBOutlet weak var displayPrice: UILabel!
    
    @IBOutlet weak var uPrice: UITextField!
    
    @IBAction func uValidatePrice(_ sender: Any) {
        print(price)
        let priceUser = Int(uPrice.text ?? "") ?? 0
        justePrix(priceChoice: priceUser)
        uPrice.text = ""
    }
    /*  if let uText =  Int(priceUser.text!){
        justePrix(let: uText)
        }else{
            print("Ca ne fonctionne pas ma chabine")
        }
        */
       
        
    
}

