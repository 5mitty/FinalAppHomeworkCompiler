//
//  ViewController.swift
//  FinalAppHomeworkCompiler
//
//  Created by Jacob Smith on 12/11/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit
import CoreData


extension ViewController: UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let classEntity = classes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = classEntity.value(forKeyPath: "name") as? String
        return cell
    }
    
}

class ViewController: UIViewController {

    // properties:
    @IBOutlet weak var tableView: UITableView!
    var classes: [NSManagedObject] = []
    
    
    
    // functions:
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "The List of Classes"
        tableView.register(UITableView.self, forCellReuseIdentifier: "Cell")
    }
    

    @IBAction func addClass(_ sender: UIBarButtonItem) {
        
        
        let alert = UIAlertController(title: "New Class", message: "Add a new Class", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) {
            [unowned self] action in
            
            guard let textField = alert.textFields?.first, let classToSave = textField.text else {
                return
            }
            
            self.save(name: classToSave)
            self.tableView.reloadData()
        }
        
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addTextField()
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    func save(name: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        //1: NSManagedObjectContext
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //2: Create new NSManagedObject
        let entity = NSEntityDescription.entity(forEntityName: "ClassEntity", in: managedContext)!
        
        let classEqualsEntity = NSManagedObject(entity: entity, insertInto: managedContext)
        
        //3: KVC, NSManagedObject
        classEqualsEntity.setValue(name, forKeyPath: "name")
        
        //4: save changes to disk by calling save
        do {
            try managedContext.save()
            classes.append(classEqualsEntity)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
}


