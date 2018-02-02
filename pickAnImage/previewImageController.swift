//
//  previewImageController.swift
//  pickAnImage
//
//  Created by Mohsin on 02/02/2018.
//  Copyright © 2018 Mohsin. All rights reserved.
//

import UIKit

class previewImageController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var meme = [Meme]()
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.meme[0].bottomText)
        self.imageView.image = self.meme[0].memedImage
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancle(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func editMeme(_ sender: UIBarButtonItem) {
    }

}
