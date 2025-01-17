#!/usr/bin/env bash

set -ex

if [ $# -eq 0 ] ; then
    echo "usage: $0 <target> ..."
    echo
    echo "Common uses:"
    echo "    $0 build"
    exit 1
fi

TARGETS="$@"

build() {
    just R_VERSION=3.1.3 PYTHON_VERSION=2.7.18 ${1}
    just R_VERSION=3.2.5 PYTHON_VERSION=2.7.18 ${1}
    just R_VERSION=3.3.3 PYTHON_VERSION=3.6.13 ${1}
    just R_VERSION=3.3.3 PYTHON_VERSION=3.6.13 ${1}
    just R_VERSION=3.4.4 PYTHON_VERSION=3.6.13 ${1}
    just R_VERSION=3.4.4 PYTHON_VERSION=3.7.10 ${1}
    just R_VERSION=3.5.3 PYTHON_VERSION=2.7.18 ${1}
    just R_VERSION=3.5.3 PYTHON_VERSION=3.7.10 ${1}
    just R_VERSION=3.6.3 PYTHON_VERSION=2.7.18 ${1}
    just R_VERSION=3.6.3 PYTHON_VERSION=3.6.13 ${1}
    just R_VERSION=3.6.3 PYTHON_VERSION=3.8.8 ${1}
    just R_VERSION=4.0.5 PYTHON_VERSION=3.6.13 ${1}
    just R_VERSION=4.0.5 PYTHON_VERSION=3.7.10 ${1}
    just R_VERSION=4.0.5 PYTHON_VERSION=3.8.8 ${1}
    just R_VERSION=4.0.5 PYTHON_VERSION=3.9.2 ${1}
    just R_VERSION=4.1.0 PYTHON_VERSION=3.8.8 ${1}
    just R_VERSION=4.1.0 PYTHON_VERSION=3.9.2 ${1}
}

# build content-base
pushd base/
build "${TARGETS[@]}"
popd

# build content-pro
pushd pro/
build "${TARGETS[@]}"
popd
