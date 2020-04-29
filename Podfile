# Uncomment the next line to define a global platform for your project

platform :osx, '10.14'

 use_frameworks!
 project 'HHC For Mac.xcodeproj'





def application_pods
  
pod 'SAMKeychain'


end



def shared_pods
   
   pod 'Realm'
   pod 'AFNetworking'
    
end





target 'HHC For Mac' do
  # Comment the next line if you don't want to use dynamic frameworks
  # Pods for HHC For Mac
   application_pods
   shared_pods
   
end




  target 'HHC For MacTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'HHC For MacUITests' do
    inherit! :search_paths
    # Pods for testing
  end


