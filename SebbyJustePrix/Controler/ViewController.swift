//
//  ViewController.swift
//  SebbyJustePrix
//
//  Created by DAGUIN Sébastien on 01/12/2020.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    var uName = ""
    var score = 0
    var uGamer : Gamer!
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    let price = Int.random(in: 0...500)
    
    func justePrix(priceChoice : Int) -> Int {
        print("ok")
        if priceChoice > price {
            displayPrice.text = "C'est moins"
            return 0
        }
        else if priceChoice < price {
            displayPrice.text = "C'est plus"
            return 0
        }
        else {
            displayPrice.text = "Vous avez gagner"
            return 2
        }
    }
    
    @IBOutlet weak var displayPrice: UILabel!
    
    @IBOutlet weak var validateCustom: UIButton!
    @IBOutlet weak var uPrice: UITextField!
    
    @IBAction func congratButton(_ sender: Any) {
        print("Apuie Second")
        
    }
    
    @IBAction func uValidatePrice(_ sender: Any) {
        var vict = 0
            
        print(price)
        let priceUser = Int(uPrice.text ?? "") ?? 0
        vict = justePrix(priceChoice: priceUser)
        print(vict)
        uPrice.text = ""
        score += 1
        let contraintDifficult = checkDifficult(uScore: score)
        
        print(uGamer.difficult)
        if contraintDifficult == true && vict == 2{
            print("C'est lance")
            uPrice.resignFirstResponder()
            uGamer.score = score
            performSegue(withIdentifier: "congratVictory", sender: nil)
        }else if contraintDifficult == false{
            uPrice.resignFirstResponder()
            performSegue(withIdentifier: "gameOverVictory", sender: nil)
            uGamer.score = score
        }
    }
    private func checkDifficult(uScore : Int) -> Bool{
        
        let difficult = uGamer.difficult
        
        if difficult == 0 {
            if uScore > 21{
                
                return false
            }
        }else if difficult == 1 {
            if uScore > 14{
                
                return false
            }
        }else if difficult == 2 {
            if uScore > 7{
                return false
            }
        }else {
            return true
        }
        return true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "congratVictory"{
            let VCDestination = segue.destination as! CongratViewController
            VCDestination.uGamer = uGamer
            
        }
    }
    
        
    
}

