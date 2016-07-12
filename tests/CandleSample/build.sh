#!/bin/sh

print_usage() {
    echo "Usage: $0 <configuration>"
    echo "       configuration - Debug or Release(default)"
}

handle_error_code() {
    echo "Build error! Code: $1"
    cd ..
    exit $1
}

CONF_DEBUG=Debug
CONF_RELEASE=Release
CONFIGURATION=$CONF_RELEASE
BUILD_PATH=build

if [ $# -eq 0 ]; then
    :
elif [ $# -eq 1 ]; then
    if [ "$1" = "$CONF_DEBUG" ]; then
        CONFIGURATION=$CONF_DEBUG
    elif [ "$1" = "$CONF_RELEASE" ]; then
        CONFIGURATION=$CONF_RELEASE
    else
        print_usage
        exit
    fi
else
    print_usage
    exit
fi

echo "Start building $CONFIGURATION..."

mkdir -p $BUILD_PATH
cd $BUILD_PATH

cmake -DCMAKE_BUILD_TYPE=$CONFIGURATION -G "Unix Makefiles" ..
if [ $? -ne 0 ]; then
    handle_error_code $?
fi

make
if [ $? -ne 0 ]; then
    handle_error_code $?
fi

echo "Build success."
cd ..