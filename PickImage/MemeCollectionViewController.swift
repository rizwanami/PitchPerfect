//
//  MemeCollectionViewController.swift
//  PickImage
//
//  Created by Mohammed Ibrahim on 7/17/16.
//  Copyright © 2016 myw. All rights reserved.
//

import Foundation
import UIKit
class MemeCollectionViewController : UICollectionViewController {
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
   var memes = [MemeMeObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let space: CGFloat = 3.0
        let dimensionWidth = (self.view.frame.size.width - (2 * space)) / 3.0
        let dimensionHeight = (self.view.frame.size.height - (2 * space)) / 3.0
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSizeMake(dimensionWidth, dimensionHeight)
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        memes = appDelegate.memes
        collectionView?.reloadData()
        
    }
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MemeCollectionViewCell", forIndexPath: indexPath) as! MemeCollectionViewCell
        let item = memes[indexPath.row]
        let imageView = UIImageView(image: item.memedImage)
        cell.MemeCollectionImage = imageView
        cell.backgroundView = imageView
        return cell
        
        
    }
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let controller = storyboard?.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        controller.meme = memes[indexPath.row]
        
        self.navigationController!.pushViewController(controller, animated: true)
        
    }



}