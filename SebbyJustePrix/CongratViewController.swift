//
//  CongratViewController.swift
//  SebbyJustePrix
//
//  Created by DAGUIN Sébastien on 05/12/2020.
//

import UIKit
import SafariServices
import CoreData

class CongratViewController: UIViewController {
    var uGamer : Gamer!
    @IBOutlet weak var congatMessage: UILabel!
    @IBOutlet weak var bacToMenuCustom: UIButton!
    @IBOutlet weak var infoButtonCustom: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let name = uGamer.name!
        let score = uGamer.score
        print( "Voici le score retenue :  \(score)")
        
        
        congatMessage.text = "Felicitation \(name) votre score est \(score)"
        bacToMenuCustom.applyDesign()
        infoButtonCustom.applyDesign()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
        newUser.setValue(uGamer.name! , forKey: "userName")
        newUser.setValue(score, forKey: "userScore")
        newUser.setValue(uGamer.difficult, forKey: "userDifficult")
        
        

    }
    @IBAction func backToMenuButton(_ sender: Any) {
        print(uGamer.score)
    }
    
    @IBAction func informationDevButton(_ sender: Any) {
        
        let SCV = SFSafariViewController(url: URL(string:"https://www.notion.so/CV-Se-bastienDAGUIN2021iW-77581e8535cb4c54b957510aa1a8c20c")!)
        
        present(SCV, animated: true)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "bacToMenu" {
            _ = segue.destination as! ViewController
            
        }
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
