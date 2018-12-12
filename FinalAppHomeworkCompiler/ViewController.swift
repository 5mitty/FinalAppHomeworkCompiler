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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = classes[indexPath.row]
        return cell
    }
    
}

class ViewController: UIViewController {

    // properties:
    @IBOutlet weak var tableView: UITableView!
    var classes: [String] = []
    
    
    
    // functions:
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "The List of Classes"
        tableView.dataSource = self
    }

    @IBAction func addClass(_ sender: UIBarButtonItem) {
        
        
        let alert = UIAlertController(title: "New Class", message: "Add a new Class", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) {
            [unowned self] action in
            
            guard let textField = alert.textFields?.first, let classToSave = textField.text else {
                return
            }
            
            self.classes.append(classToSave)
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addTextField()
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    
    
}


