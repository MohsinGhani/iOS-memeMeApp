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
    @IBOutlet weak var nav: UINavigationBar!
    
    let memeTextAttributes:[String:Any] = [
        NSStrokeColorAttributeName: UIColor.black,
        NSForegroundColorAttributeName: UIColor.white,
        NSFontAttributeName: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
        NSStrokeWidthAttributeName: -5.0,
        ]
    
    var meme = [Meme]()
    var editMode = false
    var editMemeIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        topTextField.isHidden = true
        bottomTextField.isHidden = true
        toolbar.isHidden = true;
        editBtn.title = "Edit";
        
        // self.imageView.image = self.meme[0].memedImage
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.meme = [appDelegate.memes[editMemeIndex]]
        self.imageView.image = appDelegate.memes[editMemeIndex].memedImage
        
        topTextField.delegate = self
        bottomTextField.delegate = self
        
        topTextField.defaultTextAttributes = memeTextAttributes
        bottomTextField.defaultTextAttributes = memeTextAttributes
        
        topTextField.textAlignment = .center
        bottomTextField.textAlignment = .center
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
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
            print("editMode = \(editMode)")
        }
        else{
            updateMeme()
            self.editBtn.title = "Edit"
            topTextField.isHidden = true
            bottomTextField.isHidden = true
            toolbar.isHidden = true;
            
            // imageView.image = self.meme[0].memedImage
            editMode = false
            
            print("editMode = \(editMode)")
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.image = selectedImage
        self.meme[0].orignalImage = selectedImage
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
    
    func updateMeme() {
        let memedImage = generateMemedImage()
        imageView.image = memedImage
        
        let newMeme = Meme(memedImage:memedImage, topText: topTextField.text!, bottomText: bottomTextField.text!, orignalImage: self.meme[0].orignalImage)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.memes[editMemeIndex] = newMeme
    }
    
    func generateMemedImage() -> UIImage {
        
        // Hide toolbar and navbar
        self.nav.isHidden = true
        self.toolbar.isHidden = true
        
        // Render view to an image
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let memedImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        // Show toolbar and navbar
        self.nav.isHidden = false
        self.toolbar.isHidden = false
        
        return memedImage
    }

}
