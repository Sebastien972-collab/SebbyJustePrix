//
//  MenuViewControlerViewController.swift
//  SebbyJustePrix
//
//  Created by DAGUIN Sébastien on 05/12/2020.
//

import UIKit
import CoreData

class MenuViewControlerViewController: UIViewController {
   
    @IBOutlet weak var userName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func launchGame(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
        newUser.setValue(userName.text, forKey: "userName")
        newUser.setValue(0, forKey: "userScore")
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
            VCDestination.uName = userName.text!
            
        }
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
