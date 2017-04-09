Pod::Spec.new do |s|

  s.name         = "KRImagePickerController"
  s.version      = "0.0.1"
  s.summary      = "KRImagePickerController is written is Swift a wrapper above UIImagePickerController to simplify its usage"

  s.homepage     = "https://github.com/ulian-onua/KRImagePickerController"

  s.license      = { :type => "MIT", :file => "LICENSE" }



  s.author             = { "Julian Drapaylo" => "ulian.onua@gmail.com" }
#s.social_media_url   = "http://www.linkedin.com/in/julian-drapaylo"



  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/ulian-onua/KRImagePickerController.git", :tag => "0.0.1" }


  s.source_files  = "Source/*.{swift}"
#s.public_header_files = "Source/*.{swift}"

  s.frameworks = "Foundation", "UIKit"
  s.requires_arc = true

end
