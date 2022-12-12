

//  ViewController.swift
//  To-Do List App
//
/* Created and Developed by
 Manmeen Kaur - 301259638
 Neha Patel - 301280513
 Sarthak Vashistha - 301245284
 
 Date Created: 11/12/2022
 To-Do List App - Created App UI (To Do List Table View screen + To Do Details screen) - Portrait & Landscape View
 Version: 1.0.0
 */
//
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var task: [String] = ["Task#1", "Task#2", "Task#3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Tasks"
        // Do any additional setup after loading the view.
    }

   
    @IBOutlet weak var table: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return task.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                
                cell.textLabel?.text = task[indexPath.row]
                
                let switchView = UISwitch(frame: .zero)
                switchView.setOn(false, animated: true)
       
                switchView.tag = indexPath.row
                switchView.addTarget(self, action: #selector(self.switchDidChange(_:)), for: .valueChanged)
                cell.accessoryView = switchView
                
                
                
                return cell
    }
    @objc func switchDidChange(_ sender: UISwitch){
        print("sender is \(sender.tag)")
    }
}

