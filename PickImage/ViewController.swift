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
    @IBOutlet weak var TextField1: UITextField!
    @IBOutlet weak var TextField2: UITextField!
    
       override func viewDidLoad() {
        super.viewDidLoad()
        TextField1.delegate = self
        TextField2.delegate = self
                    }

    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
       
        cameraButton.enabled = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
        

    }
    func imagePickerController(_picker: UIImagePickerController,didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            ImagePickerView.image = image
            ImagePickerView.contentMode = .ScaleToFill
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
        TextField1.delegate = self
        TextField2.delegate = self
        textField.resignFirstResponder()
        return true;
    }
    
    

    

}

