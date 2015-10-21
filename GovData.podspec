Pod::Spec.new do |s|
	s.name							= 'GovData'
	s.version						= '0.0.0'
	s.summary						= 'GovData iOS SDK'
	s.homepage						= 'https://github.com/hackenbruder/govdata-ios'
	s.license						= { :type => 'MIT', :file => 'LICENSE.md' }
	s.source						= { :git => 'https://github.com/hackenbruder/govdata-ios.git' }
	s.author						= { "Richard Hackenbruder" => "hackenbruder@govdata.cz" }
	s.source_files					= 'GovData', 'GovData/**/*.{h,m}'
	s.public_header_files			= 'GovData/**/*.h'
	s.framework						= 'SystemConfiguration'
	s.requires_arc					= true
	s.dependency					= 'AFNetworking'
	s.resource_bundles				= { 'GovData' => [ 'GovData.strings' ] }
end
