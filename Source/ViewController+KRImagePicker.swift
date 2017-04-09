//
//  ViewController+KRImagePicker.swift
//  KRImagePickerControllerExample
//
//  Created by ulian_onua on 4/9/17.
//  Copyright © 2017 ulian_onua. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController {
    
    func pickFromPhotoLibrary(completion : @escaping ImageCompletion) {
        KRImagePickerController.pick(from: self, sourceType: .photoLibrary, completion: completion)
    }
    
    func pickFromCamera(completion : @escaping ImageCompletion) {
        KRImagePickerController.pick(from: self, sourceType: .camera, completion: completion)
    }
    
    func pickFromSavedPhotosAlbum(completion : @escaping ImageCompletion) {
         KRImagePickerController.pick(from: self, sourceType: .savedPhotosAlbum, completion: completion)
    }
    
    func pick(sourceType : UIImagePickerControllerSourceType, completion : @escaping ImageCompletion) {
        KRImagePickerController.pick(from: self, sourceType: sourceType, completion: completion)
    }

}
