//
//  KRImagePickerController.swift
//  KRImagePickerControllerExample
//
//  Created by ulian_onua on 4/4/17.
//  Copyright © 2017 ulian_onua. All rights reserved.
//

import Foundation
import UIKit


let photoLibraryIsNotAvailable = "Photo Library is not available"
let cameraIsNotAvailable = "Camera is not available"
let savedPhotosAlbumIsNotAvailable = "Saved photos album is not available"

enum KRImagePickerControllerError : Error {
    case sourceTypeIsNotAvalable(String)
    case operationWasCancelled
    case errorPickingImage
}

typealias ImageCompletion = (UIImage?, KRImagePickerControllerError?) -> Void

class KRImagePickerController : NSObject {
    
    static var imagePickerController : KRImagePickerController? = nil

    var imagePicker : UIImagePickerController =  UIImagePickerController()
    
    fileprivate override convenience init() {
        self.init(sourceType: .photoLibrary)
    }
    
    fileprivate init(sourceType : UIImagePickerControllerSourceType) {
        super.init()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
    }
    
    fileprivate static var imagePickerCompletion : ImageCompletion?
    
    class func pickFromPhotoLibrary(viewController : UIViewController, completion : @escaping ImageCompletion) {
        pick(from: viewController, sourceType: .photoLibrary, completion: completion)
    }
    
    class func pickFromCamera(viewController : UIViewController, completion : @escaping ImageCompletion) {
        pick(from: viewController, sourceType: .camera, completion: completion)
    }
    
    class func pickFromSavedPhotosAlbum(viewController : UIViewController, completion : @escaping ImageCompletion) {
        pick(from: viewController, sourceType: .savedPhotosAlbum, completion: completion)
    }
    
    
    class func pick(from viewController : UIViewController, sourceType : UIImagePickerControllerSourceType, completion : @escaping ImageCompletion) {
        guard UIImagePickerController.isSourceTypeAvailable(sourceType) else {
            completion(nil, errorForUnavailableSourceType(sourceType: sourceType))
            return
        }
        guard let imagePicker = KRImagePickerController.getImagePickerController() else {return}
    
        imagePickerCompletion = completion
        viewController.present(imagePicker.imagePicker, animated: true, completion: nil)
    }
    
    
    //MARK: Helpers
    
    fileprivate class func errorForUnavailableSourceType(sourceType : UIImagePickerControllerSourceType) -> KRImagePickerControllerError {
        switch sourceType {
        case .camera:
            return .sourceTypeIsNotAvalable(cameraIsNotAvailable)
        case .photoLibrary:
            return .sourceTypeIsNotAvalable(photoLibraryIsNotAvailable)
        case .savedPhotosAlbum:
            return .sourceTypeIsNotAvalable(savedPhotosAlbumIsNotAvailable)
        }
    }
    
    fileprivate class func getImagePickerController() -> KRImagePickerController? {
        guard let imagePicker = imagePickerController else {
            imagePickerController = KRImagePickerController.init()
            return imagePickerController
        }
        return imagePicker
    }
    
    
    fileprivate class func clearMemory() {
        imagePickerController = nil
    }
}

extension KRImagePickerController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])  {
        guard let image = info[UIImagePickerControllerEditedImage] as? UIImage else {
            KRImagePickerController.imagePickerCompletion?(nil, .errorPickingImage)
            return
        }
        picker.dismiss(animated: true, completion: nil)
        KRImagePickerController.imagePickerCompletion?(image, nil)
        defer {
            KRImagePickerController.clearMemory()
        }
    }
    
    internal func imagePickerControllerDidCancel(_ picker: UIImagePickerController)   {
        picker.dismiss(animated: true, completion: nil)
        KRImagePickerController.imagePickerCompletion?(nil, .operationWasCancelled)
        KRImagePickerController.clearMemory()
    }
}

