Pod::Spec.new do |s|
  s.name             = "PXPinnedRotation"
  s.version          = "0.1.2"
  s.summary          = "A view and a view controller that let's you do pinned rotation with ease.'"
  s.description      = <<-DESC
                       A view and view controller subclass that let you specify which of your view's subviews should rotate in place when the phone rotates.
                       DESC
  s.homepage         = "https://github.com/pixio/PXPinnedRotation"
  s.license          = 'MIT'
  s.author           = { "Daniel Blakemore" => "DanBlakemore@gmail.com" }
  s.source = {
    :git => "https://github.com/pixio/PXPinnedRotation.git",
    :tag => s.version.to_s
  }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'PXPinnedRotation' => ['Pod/Assets/*.png']
  }

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
end
