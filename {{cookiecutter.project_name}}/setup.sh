#!/bin/bash

package="{{cookiecutter.project_name}}"

set -xe

origin=$(pwd)
version=$(cd {{cookiecutter.project_name}} && git describe --tags --abbrev=0)

install=$origin/lmod/dist/$(arch)/$package/$version
module=$origin/lmod/modules/$(arch)/$package/

mkdir -p $install
mkdir -p $module

NJ=${NJ:-$(nproc)}
# ===============

# Compile & install {{cookiecutter.project_name}}
rm -rf $install/*
cd $package

make install -j$NJ\
    MOREFLAGS="-mtune=haswell -Wl,-z,now" \
    PREFIX="$install"

cd ..


# Setup the module file
cp $package.lua $module/$version.lua

sed -i -e "s@\${package}@$package@g" $module/$version.lua
sed -i -e "s@\${version}@$version@g" $module/$version.lua
