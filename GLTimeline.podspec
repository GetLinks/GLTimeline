Pod::Spec.new do |s|
  s.name         = "GLTimeline"
  s.version      = "0.0.2"
  s.summary      = "GLTimeline is a simple timeline view implemented by UIView written in Swift 3.0"
  s.description  = "GLTimeline is a simple timeline view implemented by UIView written in Swift 3.0 that original use in Getlinks Application Project."

  s.homepage     = "https://github.com/GetLinks/GLTimeline"
  s.license      = "MIT"
  s.author             = { "Satjawat Panakarn" => "peanutbutteer@gmail.com" }
  s.platform     = :ios
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/GetLinks/GLTimeline.git", :tag => "#{s.version}" }
  s.source_files  = "GLTimeline/*"
  s.ios.frameworks = 'UIKit', 'Foundation'
end
