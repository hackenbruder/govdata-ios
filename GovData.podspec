Pod::Spec.new do |s|
	s.name								= 'GovData'
	s.version							= '1.0.31'
	s.summary							= 'GovData iOS SDK'
	s.homepage						= 'https://github.com/hackenbruder/govdata-ios'
	s.platform						= :ios, '8.0'
	s.license							= { :type => 'MIT', :file => 'LICENSE.md' }
	s.source							= { :git => 'https://github.com/hackenbruder/govdata-ios.git', :tag => s.version }
	s.author							= { 'Richard Hackenbruder' => 'hackenbruder@govdata.cz' }
	s.source_files				= 'GovData/**/*.{h,m}'
	s.public_header_files	= 'GovData/**/*.h'
	s.user_target_xcconfig = { 'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES' }
	s.framework						= 'SystemConfiguration'
	s.requires_arc				= true
	s.resource_bundles		= { 'GovData' => [ '*.lproj' ] }
	s.dependency					'AFNetworking'
end
