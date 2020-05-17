//
//  ViewController.swift
//  BucketList
//
//  Created by Deepansh Saini on 16/05/20.
//  Copyright © 2020 Deepansh Saini. All rights reserved.
//

import UIKit

class ConfusionNotVC: UIViewController {

    //Outlets
    @IBOutlet weak var itemName : UITextField!
    @IBOutlet weak var tableView : UITableView!
    
    //Array to store Items
    var itemArray : [String] = []
    //Array to store Date
    var dateArray : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.layer.cornerRadius = 5.0
    }
    
    @IBAction func addBtnPressed(_ sender: UIButton){
        if itemName.text != "" {
            
            //New element is appended to array each time add button is pressed
            itemArray.append(itemName.text!)
            itemName.text = ""
            
            //New date us appended to array each time add button is pressed
            dateArray.append(dateTime())
            
            //Table View reloads data
            tableView.reloadData()
        }else{
            return
        }
    }
    
    @IBAction func letMeDecideBtnPressed(_ sender : UIButton){
        if itemArray.count >= 1{
            
            //Getting a random item from Array
            let randomElement = itemArray.randomElement()!
            
            //Alert for selected random item from Array
            let alert = UIAlertController(title: "Go for", message: "\(randomElement)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else {
            return
        }
    }

}

extension ConfusionNotVC : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ConfusionNotTableCell
        cell.itemName?.text = itemArray[indexPath.row]
        cell.dateTime?.text = dateArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        self.itemArray.remove(at: indexPath.row)
        self.dateArray.remove(at: indexPath.row)
        tableView.beginUpdates()
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
    }
    
    
}
