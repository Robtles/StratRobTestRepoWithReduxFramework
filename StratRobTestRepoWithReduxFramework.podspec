Pod::Spec.new do |s|
  s.name             = 'StratRobTestRepoWithReduxFramework'
  s.version          = '0.1.29'
  s.summary          = 'Test :)'
  s.swift_version    = '4.2'
 
  s.description      = <<-DESC
Simple project with navigation and redux base
                       DESC
 
  s.homepage         = 'https://github.com/StratRob/StratRobTestRepoWithReduxFramework'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'StratRob' => 'dreux.robin@gmail.com' }
  s.source           = { :git => 'https://github.com/StratRob/StratRobTestRepoWithReduxFramework.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '12.1'
  s.source_files = 'StratRobTestRepoWithReduxFramework/**/*.swift'
  s.dependency 'ReSwift' 

end
