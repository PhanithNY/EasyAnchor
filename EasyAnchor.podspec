#
# Be sure to run `pod lib lint EasyAnchor.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'EasyAnchor'
  s.version          = '0.1.3'
  s.summary          = 'EasyAnchor is a small extension that save time when anchoring view using AutoLayout.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/PhanithNY/EasyAnchor'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'PhanithNY' => 'ny.phanith.fe@gmail.com' }
  s.source           = { :git => 'https://github.com/PhanithNY/EasyAnchor.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/Ny_Phanith'

  s.ios.deployment_target = '10.0'

  s.source_files = 'Sources/EasyAnchor/**/*'
  
  # s.resource_bundles = {
  #   'EasyAnchor' => ['EasyAnchor/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
end
