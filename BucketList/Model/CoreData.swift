//
//  CoreData.swift
//  BucketList
//
//  Created by Deepansh Saini on 18/05/20.
//  Copyright © 2020 Deepansh Saini. All rights reserved.
//

import Foundation
import CoreData
import UIKit

func createData(){
       guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
       
       let mangedContext = appDelegate.persistentContainer.viewContext
       
       let userEntity = NSEntityDescription.entity(forEntityName: "List", in: mangedContext)!
       
       print(userEntity)
   }
