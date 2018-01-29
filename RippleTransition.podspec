#
#  Be sure to run `pod spec lint RippleTransition.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "RippleTransition"
  s.version      = "1.0.2"
  s.summary      = "A simple transition with native ripple effect."

  s.description  = 'A simple transition with native ripple effect. It is a combination between ripple and fade-out effect.'
  s.author           = { 'Rimh(Ming)' => 'rimh@github' }
  s.homepage         = 'https://github.com/rimh/RippleTransition'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Rimh(Ming)' => 'rimh@github' }
  s.source           = { :git => 'https://github.com/rimh/RippleTransition.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.source_files = 'RippleTransition/RippleTransition.swift'
end
