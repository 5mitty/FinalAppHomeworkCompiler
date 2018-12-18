//
//  SecondViewController.swift
//  FinalAppHomeworkCompiler
//
//  Created by Catherine Smith on 12/17/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var className: String = ""
    var homeworkDetail: String = ""
    
    @IBOutlet weak var homeworkDetailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func AddHomeworkDetail(_ sender: Any) {
        let alert = UIAlertController(title: "New Homework", message: "Add Homework for a your class", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) {
            [unowned self] action in
            
            guard let textField = alert.textFields?.first, let homeworkToSave = textField.text else {
                return
            }
            
            self.homeworkDetail = homeworkToSave
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let refreshAction = UIAlertAction(title: "Refresh", style: .default)
        
        alert.addTextField()
        
        alert.addAction(saveAction)
        alert.addAction(refreshAction)
        alert.addAction(cancelAction)
        
        homeworkDetailLabel.text = "Your homework for " + className + " is: " + homeworkDetail
        
        self.homeworkDetailLabel.reloadInputViews()
        
        present(alert, animated: true)
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
