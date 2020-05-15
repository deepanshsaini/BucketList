//
//  ViewController.swift
//  BucketList
//
//  Created by Deepansh Saini on 16/05/20.
//  Copyright © 2020 Deepansh Saini. All rights reserved.
//

import UIKit

class BucketListVC: UIViewController {

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
    }
    
    @IBAction func addBtnPressed(_ sender: UIButton){
        guard itemName.text != nil else { return }
        //New element is appended to array each time add button is pressed
        itemArray.append(itemName.text!)
        itemName.text = ""
        //New date us appended to array each time add button is pressed
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
        self.dateArray.remove(at: indexPath.row)
        tableView.beginUpdates()
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
    }
    
    
}
