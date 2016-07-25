
//
//  MemeDetailViewController.swift
//  PickImage
//
//  Created by Mohammed Ibrahim on 7/17/16.
//  Copyright © 2016 myw. All rights reserved.
//

import Foundation
import UIKit
class MemeDetailViewController : UIViewController {
    
    @IBOutlet var memeImage: UIImageView!
    var meme : MemeMeObject!
   override func viewDidLoad() {
       super.viewDidLoad()    }
    override func viewWillAppear(animated: Bool) {
       super.viewWillAppear(animated)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .Plain, target: self, action: "selectEditController")
       self.memeImage!.image = meme.memedImage
        
    }

    
   func edit() {
       let controller = self.storyboard?.instantiateViewControllerWithIdentifier("MemeEditorViewController") as! MemeEditorViewController
      controller.memedImage = meme.memedImage
    presentViewController(controller, animated: true, completion: nil)
    }
}