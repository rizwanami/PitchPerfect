
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
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
    override func viewWillAppear(animated: Bool) {
        viewWillAppear(animated)
       self.memeImage!.image = meme.memedImage
        
    }

}