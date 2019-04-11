

Pod::Spec.new do |s|


  s.name         = "YBHandyTableView"
  s.version      = "1.0"
  s.summary      = "让复杂 TableView 优雅起来，更轻易的实现动态化"
  s.description  = <<-DESC
  					让复杂 TableView 优雅起来，更轻易的实现动态化，使用简单易拓展
                   DESC

  s.homepage     = "https://github.com/indulgeIn"

  s.license      = "MIT"

  s.author       = { "杨波" => "1106355439@qq.com" }
 
  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/indulgeIn/YBHandyTableView.git", :tag => "#{s.version}" }

  s.source_files  = "YBHandyTableView/**/*.{h,m}"

  s.requires_arc = true

end
