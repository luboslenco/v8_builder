git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
export PATH=$(pwd)/depot_tools:$PATH
gclient
mkdir v8
cd v8
fetch v8
cd v8
git checkout 12.0.267.14
gclient sync
gn gen out/macos --args='is_component_build=false is_debug=true target_cpu="arm64" use_custom_libcxx=false v8_enable_i18n_support=false v8_monolithic=true v8_use_external_startup_data=false v8_enable_snapshot_compression=false symbol_level=1 v8_symbol_level=1 v8_target_cpu="arm64" v8_static_library=true strip_debug_info=false v8_enable_pointer_compression=false v8_enable_31bit_smis_on_64bit_arch=false dcheck_always_on=false'
ninja -C out/macos v8_monolith