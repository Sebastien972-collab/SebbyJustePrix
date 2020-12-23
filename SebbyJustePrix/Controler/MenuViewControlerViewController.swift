//
//  MenuViewControlerViewController.swift
//  SebbyJustePrix
//
//  Created by DAGUIN Sébastien on 05/12/2020.
//

import UIKit
import CoreData

class MenuViewControlerViewController: UIViewController, UITextFieldDelegate {
   
    @IBOutlet weak var launchGameCustom: UIButton!
    @IBOutlet weak var levelDifficult: UISegmentedControl!
    
    @IBOutlet weak var userName: UITextField!
    @IBAction func unwindToWelcome(segue:UIStoryboardSegue){}
    var uGamer : Gamer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    @IBAction func launchGame(_ sender: UIButton) {
        createObject()
        launchGameCustom.pulsate()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        do {
            try context.save()
            print("Context save")
        } catch  {
            print("Erreur : impossible de sauvegarder mon context")
        }
        performSegue(withIdentifier: "showGame", sender: nil)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showGame" {
            let VCDestination = segue.destination as! ViewController
            VCDestination.uGamer = uGamer 
        }
    }
    private func createObject(){
        let name  = userName.text 
        let difficult = levelDifficult.selectedSegmentIndex
        uGamer = Gamer(name: name,score: 0, difficult: difficult)
        
    }

    @IBAction func infoButton(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(request)
            
            if results.count > 0 {
                for r in results as! [NSManagedObject] {
                if let userName = r.value(forKey: "userName") as? String{
                    print(userName)
                }
                    if let userScore = r.value(forKey: "userScore") {
                        print(userScore)
                    }
                }
            }
            
        } catch  {
            print("Error ")
        }
    }
}
