#
# Be sure to run `pod lib lint GPNavigationController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GPNavigationController'
  s.version          = '0.1.4'
  s.summary          = 'iOS UI基础框架 GPNavigationController.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/ziyue92/GPNavigationController'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ziyue92' => 'ziyue92@qq.com' }
  s.source           = { :git => 'https://github.com/ziyue92/GPNavigationController.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'GPNavigationController/Classes/**/*'
  
  # s.resource_bundles = {
  #   'GPNavigationController' => ['GPNavigationController/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
    s.dependency  'Reachability'

    s.prefix_header_contents = '

    #if __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000
    #define LBL_TEXTSIZE(text, font) [text length] > 0 ? [text                                                  \
    sizeWithAttributes:@{NSFontAttributeName: font}] : \
    CGSizeZero;
    #else
    #define LBL_TEXTSIZE(text, font) [text length] > 0 ? [text sizeWithFont:font] : CGSizeZero;
    #endif

    #define GPColor(r, g, b) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:1.0]

    #define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
    #define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
    #define AppWindow [UIApplication sharedApplication].keyWindow
    #define WINDOW [[[UIApplication sharedApplication] delegate] window]

    #define isIPhoneXByHeight ([[UIScreen mainScreen] bounds].size.height == 812.f ? 1 :0 )//根据屏幕高度判断
    #define StatusHeight (isIPhoneXByHeight ? 44 : 20)//statusTabbar的高度，iPhone X的高度44
    #define NavHeight (isIPhoneXByHeight ? 88 : 64)//导航栏整体高度
    #define TopSafeAreaHeight (isIPhoneXByHeight ? 44 : 0)//顶部部安全距离高度
    #define BottomSafeAreaHeight (isIPhoneXByHeight ? 34 : 0)//底部安全距离高度
    #define TabbarHeight (isIPhoneXByHeight ? 83 : 49)//Tabbar的高度，iPhone X的高度83

'

end
