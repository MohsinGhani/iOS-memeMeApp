//
//  previewImageController.swift
//  pickAnImage
//
//  Created by Mohsin on 02/02/2018.
//  Copyright © 2018 Mohsin. All rights reserved.
//

import UIKit

class previewImageController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate  {
    //, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var editBtn: UIBarButtonItem!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    
    let memeTextAttributes:[String:Any] = [
        NSStrokeColorAttributeName: UIColor.black,
        NSForegroundColorAttributeName: UIColor.white,
        NSFontAttributeName: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
        NSStrokeWidthAttributeName: -5.0,
        ]
    
    var meme = [Meme]()
    var editMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topTextField.isHidden = true
        bottomTextField.isHidden = true
        toolbar.isHidden = true;
        editBtn.title = "Edit";

        self.imageView.image = self.meme[0].memedImage
        
        topTextField.delegate = self
        bottomTextField.delegate = self
        
        topTextField.defaultTextAttributes = memeTextAttributes
        bottomTextField.defaultTextAttributes = memeTextAttributes
        
        topTextField.textAlignment = .center
        bottomTextField.textAlignment = .center
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancle(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func editMeme(_ sender: UIBarButtonItem) {
        if !editMode {
            self.editBtn.title = "Save"
            topTextField.isHidden = false
            bottomTextField.isHidden = false
            toolbar.isHidden = false;
            
            topTextField?.text = self.meme[0].topText
            bottomTextField?.text = self.meme[0].bottomText
            
            imageView.image = self.meme[0].orignalImage
            editMode = true
        }
        else{
            self.editBtn.title = "Edit"
            
            topTextField.isHidden = true
            bottomTextField.isHidden = true
            toolbar.isHidden = true;
            
            imageView.image = self.meme[0].memedImage
            editMode = false
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.image = selectedImage
        print("pick image success")
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pickImage(_ sender: UIBarButtonItem) {
        print("pick image clicked")
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    

}
