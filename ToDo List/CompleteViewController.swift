//
//  CompleteViewController.swift
//  ToDo List
//
//  Created by ZappyCode on 10/2/19.
//  Copyright © 2019 ZappyCode. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {
    
    @IBOutlet weak var toDoLabel: UILabel!
    var toDo: TodoItem?
    var toDoTableVC : ToDoTableViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if toDo != nil {
            if toDo!.important {
                if let name = toDo?.name {
                    toDoLabel.text = "❗️" + name
                }
            } else {
                toDoLabel.text = toDo!.name
            }
        }
    }

    @IBAction func completeTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if toDo != nil {
                context.delete(toDo!)
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                navigationController?.popViewController(animated: true)
            }
        }
//        if let toDos = toDoTableVC?.toDos {
//            var index = 0
//            for x in toDos {
//                if x.name == toDo?.name {
//                    toDoTableVC?.toDos.remove(at: index)
//                    toDoTableVC?.tableView.reloadData()
//                    navigationController?.popViewController(animated: true)
//                    return
//                }
//                index += 1
//            }
//        }
    }
    
}
