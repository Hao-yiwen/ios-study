source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/facebook/react-native.git'

require_relative './rnDemo/node_modules/react-native/scripts/react_native_pods'
require_relative './rnDemo/node_modules/@react-native-community/cli-platform-ios/native_modules'

require_relative './PodHelpers'

platform :ios, '13.0'

install! 'cocoapods',
         :deterministic_uuids => false

target 'ios-study' do
  use_frameworks! :linkage => :static

  
  # Pods for ios-study
  pod 'TestModule', :path => './TestModule'
  pod 'SwiftUIModule', :path => './SwiftUIModule'

  # React Native Pods
  pod 'React', :path => './rnDemo/node_modules/react-native/'
  pod 'React-Core', :path => './rnDemo/node_modules/react-native/'
  pod 'React-CoreModules', :path => './rnDemo/node_modules/react-native/React/CoreModules'
  pod 'React-RCTImage', :path => './rnDemo/node_modules/react-native/Libraries/Image'
  pod 'React-RCTText', :path => './rnDemo/node_modules/react-native/Libraries/Text'
  pod 'React-RCTNetwork', :path => './rnDemo/node_modules/react-native/Libraries/Network'
  pod 'React-RCTActionSheet', :path => './rnDemo/node_modules/react-native/Libraries/ActionSheetIOS'
  pod 'React-cxxreact', :path => './rnDemo/node_modules/react-native/ReactCommon/cxxreact'
  pod 'ReactCommon/turbomodule/core', :path => "./rnDemo/node_modules/react-native/ReactCommon"
  pod 'Yoga', :path => './rnDemo/node_modules/react-native/ReactCommon/yoga'
  pod 'React-RCTAnimation', :path => './rnDemo/node_modules/react-native/Libraries/NativeAnimation'
  pod 'React-RCTBlob', :path => './rnDemo/node_modules/react-native/Libraries/Blob'
  pod 'React-RCTLinking', :path => './rnDemo/node_modules/react-native/Libraries/LinkingIOS'
  pod 'React-RCTSettings', :path => './rnDemo/node_modules/react-native/Libraries/Settings'
  pod 'React-RCTVibration', :path => './rnDemo/node_modules/react-native/Libraries/Vibration'
  pod 'RCTTypeSafety', :path => './rnDemo/node_modules/react-native/Libraries/TypeSafety'
  pod 'React-perflogger', :path => './rnDemo/node_modules/react-native/ReactCommon/reactperflogger'
  pod 'React-jsi', :path => './rnDemo/node_modules/react-native/ReactCommon/jsi'
  pod 'React-jsiexecutor', :path => './rnDemo/node_modules/react-native/ReactCommon/jsiexecutor' # Corrected line
  pod 'React-utils', :path => './rnDemo/node_modules/react-native/ReactCommon/react/utils'
  pod 'React-featureflags', :path => './rnDemo/node_modules/react-native/ReactCommon/react/featureflags'
  pod 'React-runtimescheduler', :path => './rnDemo/node_modules/react-native/ReactCommon/react/renderer/runtimescheduler'
  pod 'React-NativeModulesApple', :path => './rnDemo/node_modules/react-native/ReactCommon/react/nativemodule/core/platform/ios'
  pod 'React-jsinspector', :path => './rnDemo/node_modules/react-native/ReactCommon/jsinspector-modern'
  pod 'React-callinvoker', :path => './rnDemo/node_modules/react-native/ReactCommon/callinvoker'
  pod 'React-logger', :path => './rnDemo/node_modules/react-native/ReactCommon/logger'
  pod 'React-debug', :path => './rnDemo/node_modules/react-native/ReactCommon/react/debug'
  pod 'React-runtimeexecutor', :path => './rnDemo/node_modules/react-native/ReactCommon/runtimeexecutor'
  pod 'RCTDeprecation', :path => './rnDemo/node_modules/react-native/ReactApple/Libraries/RCTFoundation/RCTDeprecation'
  pod 'React-rendererdebug', :path => './rnDemo/node_modules/react-native/ReactCommon/react/renderer/debug'
  pod 'FBLazyVector', :path => './rnDemo/node_modules/react-native/Libraries/FBLazyVector'
  pod 'React-hermes', :path => './rnDemo/node_modules/react-native/ReactCommon/hermes'
  pod 'RCTRequired', :path => './rnDemo/node_modules/react-native/Libraries/Required'
  
  pod 'DoubleConversion', :podspec => './rnDemo/node_modules/react-native/third-party-podspecs/DoubleConversion.podspec'
  pod 'glog', :podspec => './rnDemo/node_modules/react-native/third-party-podspecs/glog.podspec'
  pod 'RCT-Folly', :podspec => "./rnDemo/node_modules/react-native/third-party-podspecs/RCT-Folly.podspec"
  pod 'boost', :podspec => './rnDemo/node_modules/react-native/third-party-podspecs/boost.podspec'
  pod 'fmt', :podspec => './rnDemo/node_modules/react-native/third-party-podspecs/fmt.podspec'
  
  post_install do |installer|
      installer.pods_project.targets.each do |target|
        if target.name == 'ReactCommon'
          target.build_phases.each do |phase|
            if phase.respond_to?(:remove_file_reference)
              duplicate_files = []

              phase.files.each do |file|
                file_path = file.file_ref.path
                if file_path == 'react/featureflags/ReactNativeFeatureFlagsAccessor.h'
                  if duplicate_files.include?(file_path)
                    phase.remove_file_reference(file.file_ref)
                  else
                    duplicate_files << file_path
                  end
                end
              end
            end
          end
        end
      end
    end
end
