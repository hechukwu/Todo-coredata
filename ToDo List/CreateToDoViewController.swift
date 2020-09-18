//
//  CreateToDoViewController.swift
//  ToDo List
//
//  Created by ZappyCode on 10/1/19.
//  Copyright © 2019 ZappyCode. All rights reserved.
//

import UIKit

class CreateToDoViewController: UIViewController {
    
    @IBOutlet weak var importantSwitch: UISwitch!
    @IBOutlet weak var nameTextField: UITextField!
    var toDoTableVC : ToDoTableViewController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func addTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let newToDo = TodoItem(context: context)
            if let name =  nameTextField.text {
                newToDo.name = name
                newToDo.important = importantSwitch.isOn
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                navigationController?.popViewController(animated: true)
            }
        }
    }
    
}
