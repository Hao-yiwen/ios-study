require Pod::Executable.execute_command('node', ['-p',
  'require.resolve(
    "react-native/scripts/react_native_pods.rb",
    {paths: [process.argv[1]]},
  )', __dir__]).strip

platform :ios, '16.0'
prepare_react_native_project!

linkage = ENV['USE_FRAMEWORKS']
if linkage != nil
  Pod::UI.puts "Configuring Pod with #{linkage}ally linked Frameworks".green
  use_frameworks! :linkage => linkage.to_sym
end

# flutter path
flutter_application_path = './my_flutter'
load File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')

target 'ios-study' do
  config = use_native_modules!

  use_react_native!(
    :path => "./node_modules/react-native",
    # An absolute path to your application root.
    :app_path => "#{Pod::Config.instance.installation_root}",
    :hermes_enabled => true
  )
  
  install_all_flutter_pods(flutter_application_path)
  
  # Pods for ios-study
  pod 'TestModule', :path => './TestModule'
  pod 'SwiftUIModule', :path => './SwiftUIModule'
  pod 'LemoFoundation', :path => './LemoFoundation'
  pod 'lottie-ios'
  pod 'Toast-Swift', '~> 5.1.1'
  pod 'ReactiveObjC'
  pod 'AFNetworking', '~> 4.0'
  pod 'Toast', '~> 4.1.1'
  
  post_install do |installer|
    # https://github.com/facebook/react-native/blob/main/packages/react-native/scripts/react_native_pods.rb#L197-L202
    react_native_post_install(
      installer,
      "./node_modules/react-native",
      :mac_catalyst_enabled => false,
      # :ccache_enabled => true
    )
    
    flutter_post_install(installer) if defined?(flutter_post_install)
  end
end
