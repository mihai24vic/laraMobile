project 'Artable.xcodeproj'
# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
def sharedPods

    pod 'Firebase/Core'
    pod 'Firebase/Auth'
    pod 'IQKeyboardManagerSwift'
    pod 'Firebase/Firestore'
    pod 'Firebase/Storage'
    pod 'Kingfisher', '~> 4.0'
    pod 'CodableFirebase'
    pod 'Firebase'

end


target 'Artable' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  sharedPods
  #stripe for payments
  pod 'Stripe'
  pod 'Alamofire'
  
  
pod 'PopupDialog' 
  # Pods for Artable

  target 'ArtableAdminTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'ArtableAdminUITests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'ArtableTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'ArtableUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end

target 'ArtableAdmin' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  sharedPods
  
  pod 'CropViewController'
 
end
