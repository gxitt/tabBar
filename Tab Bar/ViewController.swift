//
//  ViewController.swift
//  Tab Bar
//
//  Created by Dilyara Zinovyeva on 29.10.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var textview: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addnotes(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        let notesName = textview.text!
        
        var newNotes = NotesItem()
        
        newNotes.name = notesName
        
        do {
            if let data = defaults.data(forKey: "notesItemArray") {
                var array = try JSONDecoder().decode([NotesItem].self, from: data)
                
                array.append(newNotes)
                
                let encodedata = try JSONEncoder().encode(array)
                
                defaults.set(encodedata, forKey: "notesItemArray")
                
            } else {
                
                let encodedata = try JSONEncoder().encode([newNotes])
                
                defaults.set(encodedata, forKey: "notesItemArray")
            }
            
        } catch {
            print ("unable to encode \(error)")
        }
    }
}

//        newNotes.name = taskName
//        if let array = defaults.array(forKey: "notesItemArray") {
//            taskarray = array as! [NotesItem]
//            taskarray.append(newNotes)
//            defaults.set(taskarray, forKey: "notesItemArray")
//        } else {
//            let array = [newNotes]
//            defaults.set(taskarray, forKey: "notesItemArray")
//        }
//    }
//}

        
        
//        var taskarray:[ String ] = []
//        
//        if let array = defaults.array(forKey: "taskArray") {
//            taskarray = array as! [String]
//            taskarray.append(taskName)
//            defaults.set(taskarray, forKey: "taskArray")
//        } else {
//            let array = [taskName]
//            defaults.set(array, forKey: "taskArray")
//        }
//    }
//}
