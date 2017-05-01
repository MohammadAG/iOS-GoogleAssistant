Pod::Spec.new do |s|
  s.name     = 'GoogleAssistant'
  s.version  = '0.0.1'
  s.license  = '...'
  s.authors  = { 'Mohammad Abu-Garbeyyeh' => 'mohammad7410@gmail.com' }
  s.homepage = '...'
  s.summary = '...'
  s.source = { :git => 'https://github.com/MohammadAG/iOS-GoogleHomePod.git', :tag => 'v1.0' }

  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.9'

  # We'll use protoc with the gRPC plugin.
  s.dependency '!ProtoCompiler-gRPCPlugin', '~> 1.0'

  # Pods directory corresponding to this app's Podfile, relative to the location of this podspec.
  pods_root = 'Pods'

  # Path where Cocoapods downloads protoc and the gRPC plugin.
  protoc_dir = "#{pods_root}/!ProtoCompiler"
  protoc = "#{protoc_dir}/protoc"
  plugin = "#{pods_root}/!ProtoCompiler-gRPCPlugin/grpc_objective_c_plugin"

  # Directory where you want the generated files to be placed. This is an example.
  dir = "#{pods_root}/#{s.name}"

  # Run protoc with the Objective-C and gRPC plugins to generate protocol messages and gRPC clients.
  # You can run this command manually if you later change your protos and need to regenerate.
  s.prepare_command = <<-CMD
    #{protoc} \
    --plugin=protoc-gen-grpc=#{plugin} \
    --objc_out=. \
    --grpc_out=. \
    -I . \
    -I #{protoc_dir} \
    google/*/*.proto google/*/*/*/*.proto
  CMD

  # The --objc_out plugin generates a pair of .pbobjc.h/.pbobjc.m files for each .proto file.
  s.subspec "Messages" do |ms|
    ms.source_files = "google/**/*.pbobjc.{h,m}"
    ms.header_mappings_dir = "."
    ms.requires_arc = false
    ms.dependency "Protobuf"
  end

  # The --objcgrpc_out plugin generates a pair of .pbrpc.h/.pbrpc.m files for each .proto file with
  # a service defined.
  s.subspec "Services" do |ss|
    ss.source_files = "google/**/*.pbrpc.{h,m}"
    ss.header_mappings_dir = "."
    ss.requires_arc = true
    ss.dependency "gRPC-ProtoRPC"
    ss.dependency "#{s.name}/Messages"
  end

  s.pod_target_xcconfig = {
    # This is needed by all pods that depend on Protobuf:
    'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS=1',
    # This is needed by all pods that depend on gRPC-RxLibrary:
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
    'USER_HEADER_SEARCH_PATHS' => '$SRCROOT/..'
  }
end
