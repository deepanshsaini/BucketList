//
//  ViewController.swift
//  BucketList
//
//  Created by Deepansh Saini on 16/05/20.
//  Copyright © 2020 Deepansh Saini. All rights reserved.
//

import UIKit

class BucketListVC: UIViewController {

    @IBOutlet weak var itemName : UITextField!
    @IBOutlet weak var tableView : UITableView!
        
    var itemArray : [String] = []
    var dateArray : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
    @IBAction func addBtnPressed(_ sender: UIButton){
        guard itemName.text != nil else { return }
        itemArray.append(itemName.text!)
        itemName.text = ""
        dateArray.append(dateTime())
        tableView.reloadData()
    }

}

extension BucketListVC : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ItemCell
        cell.itemName?.text = itemArray[indexPath.row]
        cell.dateTime?.text = dateArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        self.itemArray.remove(at: indexPath.row)
        tableView.beginUpdates()
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
    }
    
    
}
