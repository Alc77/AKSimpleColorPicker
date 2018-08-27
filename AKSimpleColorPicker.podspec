Pod::Spec.new do |s|
  s.name             = 'AKSimpleColorPicker'
  s.version          = '0.1.0'
  s.summary          = 'A simple photoshop-like color picker.'
  s.description      = <<-DESC
  This is a simple photoshop-like color picker based on the OpenGL.
  DESC
  s.homepage         = 'https://github.com/Alc77/AKSimpleColorPicker'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Alc77' => 'akorablev77@gmail.com' }
  s.source           = { :git => 'https://github.com/Alc77/AKSimpleColorPicker.git', :tag => s.version.to_s }
  s.requires_arc     = true
  s.ios.deployment_target = '9.0'
  s.source_files = 'AKSimpleColorPicker/Classes/**/*'
  s.public_header_files = 'AKSimpleColorPicker/Classes/AKSimpleColorPicker.h', 'AKSimpleColorPicker/Classes/AKColorPickerViewController.h'
  s.frameworks = 'UIKit', 'Foundation', 'GLKit'
end
