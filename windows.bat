powershell -command "Invoke-WebRequest https://storage.googleapis.com/chrome-infra/depot_tools.zip -O depot_tools.zip"
7z x depot_tools.zip -o*
set PATH=%CD%\depot_tools;%PATH%
set DEPOT_TOOLS_WIN_TOOLCHAIN=0
call gclient
mkdir v8
cd v8
call fetch v8
cd v8
call git checkout 12.0.267.14
call gclient sync
call gn gen out\windows --args="is_component_build=false is_debug=false target_cpu=\"x64\" v8_enable_i18n_support=false v8_monolithic=true v8_use_external_startup_data=false v8_enable_snapshot_compression=false symbol_level=0 v8_symbol_level=0 v8_static_library=true strip_debug_info=true v8_enable_pointer_compression=false v8_enable_31bit_smis_on_64bit_arch=false dcheck_always_on=false is_clang=false"
call ninja -C out\windows v8_monolith