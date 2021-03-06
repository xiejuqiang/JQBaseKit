#
# Be sure to run `pod lib lint JQBaseKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JQBaseKit'
  s.version          = '0.1.0'
  s.summary          = 'a project base kit of JQBaseKit.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                          JQBaseKit 是用于构建项目的基础库工具
                       DESC

  s.homepage         = 'https://github.com/xiejuqiang/JQBaseKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'xiejuqiang' => '315210770@qq.com' }
  s.source           = { :git => 'https://github.com/xiejuqiang/JQBaseKit.git', :tag => 'v0.1.0'}
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'JQBaseKit/Classes/**/*'
  s.dependency 'MBProgressHUD'
#  s.dependency 'SDWebImage', '~> 5.9.0'
  s.dependency 'AFNetworking'
  s.dependency 'WHC_ModelSqliteKit'
  s.dependency 'YYModel'
  
  # s.resource_bundles = {
  #   'JQBaseKit' => ['JQBaseKit/Assets/*.png']
  # }

   s.public_header_files = 'JQBaseKit/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
