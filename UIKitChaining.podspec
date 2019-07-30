#
#  Be sure to run `pod spec lint ViewChaining.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "ViewChaining"
  s.version      = "1.0.1"
  s.summary      = "A short description of ViewChaining."
  s.description  = "Description"
  s.homepage     = "http://yandex.ru/ViewChaining"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Adel Khaziakhmetov" => "narruplay@mail.ru" }
  s.platform     = :ios, "8.0"
  s.source       = { :path => '.' }
  s.source_files  = "ViewChaining/**/*.{swift}"

  s.framework = "UIKit"

end
