# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'

# ignore all warnings from all pods
inhibit_all_warnings!

target 'CleanArch' do
  # Comment the next line if you don't want to use dynamic frameworks
  #use_frameworks!

  # Pods for CleanArch
  pod 'SwiftLint'
  pod 'SwiftGen'
  pod 'RealmSwift'
  pod 'Realm', :modular_headers => true
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'Alamofire', '~> 4.9.1'
  pod 'AlamofireObjectMapper', '~> 5.2.1'
  pod 'Kingfisher'
  pod 'lottie-ios'
  pod 'Firebase/Messaging'
  pod 'Firebase/Analytics'
  pod 'Firebase/Crashlytics'
end

post_install do |pi|
    pi.pods_project.targets.each do |t|
      t.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
      end
    end
end
