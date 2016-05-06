//
//  ViewController.swift
//  PickImage
//
//  Created by Mohammed Ibrahim on 4/28/16.
//  Copyright © 2016 myw. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var ImagePickerView: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
 
    
    @IBOutlet weak var topText: UITextField!
    
    @IBOutlet weak var bottomText: UITextField!
    
    @IBOutlet weak var topToolBar: UIToolbar!
    
     let memeTextAttributes = [
        NSStrokeColorAttributeName : UIColor.blackColor(), NSForegroundColorAttributeName : UIColor.blueColor(), NSFontAttributeName : UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!, NSStrokeWidthAttributeName : -1.0]
    
       override func viewDidLoad() {
        super.viewDidLoad()
        
        topText.defaultTextAttributes = memeTextAttributes
        bottomText.defaultTextAttributes = memeTextAttributes
        topText.textAlignment = NSTextAlignment.Center
        bottomText.textAlignment = NSTextAlignment.Center
    }

    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        subscribeToKeyboardNotifications()
        keyboardDidDisapper()
       
        cameraButton.enabled = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
        

    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeFromKeyboardNotifications()
        
    }
    func imagePickerController(_picker: UIImagePickerController,didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            ImagePickerView.image = image
            ImagePickerView.contentMode = .ScaleAspectFit
        }
        dismissViewControllerAnimated(true, completion: nil)
    }
    func imagePickerControllerDidCancel(_picker: UIImagePickerController)
    {
        dismissViewControllerAnimated(true, completion: nil)
    }

    
    @IBAction func pickAnImage(sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func pickAnImageFromCamera (sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(textField : UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    func keyboardWillShow(notification: NSNotification) {
        if bottomText.isFirstResponder() {
        view.frame.origin.y -= getKeyboardHeight(notification)
    }
    }
    
    func getKeyboardHeight(notification: NSNotification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.CGRectValue().height
    }
    func subscribeToKeyboardNotifications() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector:
            #selector(ViewController.keyboardWillShow(_:))    , name: UIKeyboardWillShowNotification, object: nil)
    }
    
    func unsubscribeFromKeyboardNotifications() {
        NSNotificationCenter.defaultCenter().removeObserver(self, name:
            UIKeyboardWillShowNotification, object: nil)
    }
    
    func keyboardWillHide(notification : NSNotification) {
        if bottomText.isFirstResponder() {
        view.frame.origin.y += getKeyboardHeight(notification)
        }
    }

    func keyboardDidDisapper() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
    }
    //struct MemeMeObject {
//        var top : String
//        var bottom : String
//        var image : UIImage
//        let memedImage :UIImage
//        
//        
//    }
//    func save() {
//        let memedImage : UIImage! = generateMemeImage()
//        
//        let meme = MemeMeObject(top: topText.text!, bottom: bottomText.text!, image: ImagePickerView.image!, memedImage:
//            memedImage!)
//    }
//
//    func generateMemeImage()->UIImage {
//
//        topToolBar.hidden = true
//        UIGraphicsBeginImageContext(self.view.frame.size)
//        view.drawViewHierarchyInRect(self.view.frame, afterScreenUpdates: true)
//        let memedImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        return memedImage
//    }


}

