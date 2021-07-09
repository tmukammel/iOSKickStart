#
# Be sure to run `pod lib lint iOSKickStart.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'iOSKickStart'
  s.version          = '0.2.4'
  s.summary          = 'A set of extended UIKit features to kickstart any iOS project.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A beautiful project template to kick start any iOS project. The target is to avoid recoding for features like UIView rounded rect designables or a simple scrolling form. Please contribute to this project to fill up with a standard set of features frequently needed.

Limitations:
1. You have to extend or use sub classes declared here against Apple's base classes.

This is just a basic work. Please contribute, expand and Enjoy...
                       DESC

  s.homepage         = 'https://github.com/tmukammel/iOSKickStart'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Twaha Mukammel' => 't.mukammel@aol.com' }
  s.source           = { :git => 'https://github.com/tmukammel/iOSKickStart.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/tmukammel'

  s.ios.deployment_target = '12.0'

  s.source_files = 'iOSKickStart/Classes/**/*'
  
  # s.resource_bundles = {
  #   'iOSKickStart' => ['iOSKickStart/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
