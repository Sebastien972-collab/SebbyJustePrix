//
//  CongratViewController.swift
//  SebbyJustePrix
//
//  Created by DAGUIN Sébastien on 05/12/2020.
//

import UIKit

class CongratViewController: UIViewController {
    var uName = ""
    var uScore = 0
    @IBOutlet weak var congatMessage: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        congatMessage.text = "Felicitation \(uName) votre score est \(uScore)"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
