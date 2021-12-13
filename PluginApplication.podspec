Pod::Spec.new do |s|

  s.name         = "PluginApplication"
  s.version      = "1.0.0"
  s.summary      = "plugin for application"
  s.homepage     = "https://github.com/liuxc123/PluginApplication"
  s.license      = "MIT"
  s.author       = { "liuxc123" => "lxc_work@126.com" }
  s.platform     = :ios, "8.0"

  #  When using multiple platforms
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/liuxc123/PluginApplication", :tag => "#{s.version}" }
  s.source_files  = "PluginApplication/Classes/**/*.{h,m,mm,swift}"
  s.framework  = "UIKit"

end
