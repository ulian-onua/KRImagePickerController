KRImagePickerController
===============

KRImagePickerController is written in Swift wrapper under UIImagePickerController to simplify its usage.


## Installation
####CocoaPods

Just add `pod 'KRImagePickerController'` to your Podfile and run `pod install` in Terminal from your project folder.

Write `import KRImagePickerController` in appropriate instance of UIViewController from which UIImagePickerController should be presented. 


## How to use

To pick image from camera/photo library just call one of next methods from instance of UIViewController:


```swift

func pickFromPhotoLibrary(completion : @escaping ImageCompletion)
func pickFromCamera(completion : @escaping ImageCompletion)
func pickFromSavedPhotosAlbum(completion : @escaping ImageCompletion)

func pick(sourceType : UIImagePickerControllerSourceType, completion : @escaping ImageCompletion) //сhoose source manually

```

Example:

```swift
//call this method in method of UIViewControler instance
pickFromSavedPhotosAlbum { [unowned self] (image, error) in
    if error != nil {
        //handle error
    } else {
        self.imageView.image = image
    }
}
```

## Requirements

* iOS 8.0 and above
* XCode 7+


## License

KRImagePickerController is released under the MIT license. See LICENSE for details.

## Contact

Any suggestion or question? Please create a Github issue or reach me out.

[LinkedIn](https://www.linkedin.com/in/julian-drapaylo)
