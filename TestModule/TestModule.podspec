#
# Be sure to run `pod lib lint TestModule.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TestModule'
  s.version          = '0.1.3'
  s.summary          = 'A useful description of TestModule.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

 s.homepage = 'https://github.com/Hao-yiwen/ios-study'
 # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
 s.license          = { :type => 'MIT', :file => 'LICENSE' }
 s.author           = { 'Hao-yiwen' => 'yiwenlemo@gamil.com' }
 s.source           = { :git => 'https://github.com/Hao-yiwen/ios-study.git', :tag => s.version.to_s }
 s.social_media_url = 'yiwenlemo@gmail.com'

  s.ios.deployment_target = '13.0'

  s.source_files = 'TestModule/Classes/*.{swift}'
  s.resource_bundles = {
    'TestModule' => ['TestModule/Assets/*.{xib}']
  }
  
  # s.resource_bundles = {
  #   'TestModule' => ['TestModule/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
