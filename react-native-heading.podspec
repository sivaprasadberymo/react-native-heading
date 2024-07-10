require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "react-native-heading"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.description  = <<-DESC
                  react-native-heading
                   DESC
  s.homepage     = "https://github.com/mertozylmz/react-native-heading"
  s.license      = "MIT"
  # s.license    = { :type => "MIT", :file => "FILE_LICENSE" }
  s.authors      = { "Mert Ozyilmaz" => "mertozyilmazz@gmail.com" }
  s.platforms    = { :ios => "12.4", :tvos => "12.4" }
  s.source       = { :git => "https://github.com/mertozylmz/react-native-heading.git", :tag => "#{s.version}" }

  s.source_files = "ios/**/*.{h,m,swift}"
  s.requires_arc = true

  s.dependency "React"
end

