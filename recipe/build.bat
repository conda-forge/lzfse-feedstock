@echo on
@setlocal EnableDelayedExpansion

:: Configure
cmake -S . -B build ^
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_VERBOSE_MAKEFILE=ON ^
    -Wno-dev ^
    -DBUILD_SHARED_LIBS=ON ^
    -DLZFSE_BUNDLE_MODE=OFF ^
    %CMAKE_ARGS% || goto :error

cmake --build build -j%CPU_COUNT% || goto :error
cmake --install build || goto :error

:error
echo Failed with error #%errorlevel%.
exit 1
