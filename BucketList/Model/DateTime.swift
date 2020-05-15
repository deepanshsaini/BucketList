//
//  DateTime.swift
//  BucketList
//
//  Created by Deepansh Saini on 16/05/20.
//  Copyright © 2020 Deepansh Saini. All rights reserved.
//

import Foundation
import UIKit

func dateTime () -> String{
    
    // Gets Current Date and Time
    let currentDateTime = Date()
    
    //Initializes date formatter and set the style:
    let formatter = DateFormatter()
    formatter.timeStyle = .medium
    formatter.dateStyle = .long
    
    //Gets date and time string from the data object
    let dateTimeString = formatter.string(from: currentDateTime)
    
    return dateTimeString
}
