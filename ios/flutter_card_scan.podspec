#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_card_scan.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_card_scan'
  s.version          = '1.0.0'
  s.summary          = 'A flutter plugin with getbouncer card scan plugin integration'
  s.description      = <<-DESC
A flutter plugin with getbouncer card scan plugin integration
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'

  s.dependency 'CardScan', '~> 2.0.2'

  s.ios.deployment_target = '12.0'

  s.platform = :ios, '12.0'

  # Flutter.framework does not contain a i386 slice. Only x86_64 simulators are supported.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64' }
end
