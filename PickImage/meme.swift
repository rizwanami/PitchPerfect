//
//  meme.swift
//  PickImage
//
//  Created by Mohammed Ibrahim on 5/9/16.
//  Copyright © 2016 myw. All rights reserved.
//
import Foundation
import UIKit
struct MemeMeObject {
    var top : String!
    var bottom : String!
    var image : UIImage!
    let memedImage :UIImage!
    
    func save() {
        // Add it to the memes array in the Application Delegate
        let object = UIApplication.sharedApplication().delegate
        let appDelegate = object as! AppDelegate
        appDelegate.memes.append(self)

    }
    }
