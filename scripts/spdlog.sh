#!/bin/bash

set -e

VERSION=v1.14.1

curl -L https://github.com/gabime/spdlog/archive/refs/tags/v"$VERSION".tar.gz | tar -xz

mkdir build
pushd build

cmake ../spdlog-"$VERSION" \
    -DSPDLOG_ENABLE_PCH=ON \
    -DSPDLOG_BUILD_EXAMPLE=OFF \
    -DSPDLOG_USE_STD_FORMAT=ON \
    -DSPDLOG_DISABLE_DEFAULT_LOGGER=ON \
    -DSPDLOG_EOL=\"\\x0A\" \
    $CMAKE_CONFIGURE_ARGS

cmake --build . $CMAKE_BUILD_ARGS
cmake --install . $CMAKE_BUILD_ARGS

popd

license spdlog spdlog-"$VERSION"/LICENSE
