//
//  CoreData.swift
//  BucketList
//
//  Created by Deepansh Saini on 22/05/20.
//  Copyright © 2020 Deepansh Saini. All rights reserved.
//

import Foundation
import CoreData
import UIKit

func createData(itemsArray : [String], timeArray : [String]){
    
    //As we all know that conatiner is set up in the app delegate so we need to refer that container
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
    
    //Need to create context from this container
    let mangedContext = appDelegate.persistentContainer.viewContext
    
    //Created Entity and new record List
    let userEntity = NSEntityDescription.entity(forEntityName: "List", in: mangedContext)!
    
    //Finally we need to add data to our newly created model
    let list = NSManagedObject(entity: userEntity, insertInto: mangedContext)
    list.setValue(itemsArray, forKey: "itemArray")
    list.setValue(timeArray, forKey: "timeArray")
    
    //Now we set all values, The next step is to save item inside the coredata
    do{
        try mangedContext.save()
    }catch let error as NSError{
        print(error.localizedDescription)
    }
}

func retrieveData(){
    //As we all know that conatiner is set up in the app delegate so we need to refer that container
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
    
    //Need to create context from this container
    let mangedContext = appDelegate.persistentContainer.viewContext
    
    //Prepare the request of type NSFetchRequest for the entity
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "List")
    
    do{
        let result = try mangedContext.fetch(fetchRequest)
        for data in result as! [NSManagedObject] {
            print(data.value(forKey: "itemArray") as! String)
        }
    }catch{
        print(error.localizedDescription)
    }
}
