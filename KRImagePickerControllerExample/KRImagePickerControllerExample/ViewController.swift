//
//  ViewController.swift
//  KRImagePickerControllerExample
//
//  Created by ulian_onua on 4/4/17.
//  Copyright © 2017 ulian_onua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.red.cgColor
    }

 
   
    @IBAction func fromCamera(_ sender: Any) {
        pickFromCamera { [unowned self] (image, error) in
            if error != nil {
                print(error!)
            } else {
                self.imageView.image = image
            }
        }
    }
    
    @IBAction func fromPhotoLibrary(_ sender: Any) {
        pickFromPhotoLibrary { [unowned self] (image, error) in
            if error != nil {
                print(error!)
            } else {
                self.imageView.image = image
            }
        }
    }
    
    @IBAction func fromSavedPhotoAlbum(_ sender: Any) {
        pickFromSavedPhotosAlbum { [unowned self] (image, error) in
            if error != nil {
                print(error!)
            } else {
                self.imageView.image = image
            }
        }
    }
    
 

}

