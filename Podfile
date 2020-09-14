# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'

# ignore all warnings from all pods
inhibit_all_warnings!

target 'CleanArch' do
  # Comment the next line if you don't want to use dynamic frameworks
  #use_frameworks!

  # Pods for CleanArch
  pod 'SwiftLint'
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'AlamofireObjectMapper'
  pod 'Kingfisher'
  pod 'Firebase/Messaging'
  pod 'Firebase/Analytics'
  pod 'Firebase/Crashlytics'

end


post_install do |pi|
    pi.pods_project.targets.each do |t|
      t.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '10.0'
      end
    end
end
