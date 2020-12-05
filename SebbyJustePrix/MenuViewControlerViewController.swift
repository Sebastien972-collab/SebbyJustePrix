//
//  MenuViewControlerViewController.swift
//  SebbyJustePrix
//
//  Created by DAGUIN Sébastien on 05/12/2020.
//

import UIKit

class MenuViewControlerViewController: UIViewController {
   
    @IBOutlet weak var userName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func launchGame(_ sender: UIButton) {
        performSegue(withIdentifier: "showGame", sender: nil)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showGame" {
            let VCDestination = segue.destination as! ViewController
            VCDestination.uName = userName.text!
            
        }
    }

}
