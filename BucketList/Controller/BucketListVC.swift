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
        
    var emptyArray : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func addBtnPressed(_ sender: UIButton){
        guard itemName.text != nil else { return }
        emptyArray.append(itemName.text!)
        itemName.text = ""
        tableView.reloadData()
    }

}

extension BucketListVC : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emptyArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ItemCell
        cell.itemName?.text = emptyArray[indexPath.row]
        return cell
    }
    
    
}
