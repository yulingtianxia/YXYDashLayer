Pod::Spec.new do |s|
s.name         = "YXYDashLayer"
s.version      = "1.0.0"
s.summary      = "Just a dash rounded rect layer."
s.description  = <<-DESC
It's ugly. Yeah!
DESC
s.homepage     = "https://github.com/yulingtianxia/YXYDashLayer"

s.license = { :type => 'MIT', :file => 'LICENSE' }
s.author       = { "YangXiaoyu" => "yulingtianxia@gmail.com" }
s.social_media_url = 'https://twitter.com/yulingtianxia'
s.source       = { :git => "https://github.com/yulingtianxia/YXYDashLayer.git", :tag => s.version.to_s }

s.ios.deployment_target = "4.0"
s.tvos.deployment_target = "9.0"
s.requires_arc = true

s.source_files = "Source/*.{h,m}"
s.public_header_files = "Source/YXYColorfulDashLayer.h", "Source/YXYMaskDashLayer.h", "Source/YXYProgressDashLayer.h"
s.frameworks = 'Foundation', 'UIKit'

end
