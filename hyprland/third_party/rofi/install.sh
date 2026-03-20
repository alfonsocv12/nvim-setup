#!/bin/bash
# Automate the installation of rofi
# 
# Position flags for now
# 1 only_compile=[bool] default false
# 2 only_install=[bool] default true
#

BASH_LOCATION="$(pwd)/$(dirname "$0")"

compile() {
    mkdir build

    # Setup
    install_from_list "${BASH_LOCATION}"/package.list

    pushd "${BASH_LOCATION}"/rofi
    meson setup build -Dwayland=enabled -Dxcb=disabled

    ninja -C build
    popd

    cp -r "${BASH_LOCATION}"/rofi/build "${BASH_LOCATION}"
}

main() {
    local only_compile="${1:-0}"
    local only_install="${2:-1}"

    if [[ "${only_compile}" -eq 1 ]]; then
        compile
    fi

    if [[ "${only_install}" -eq 1 ]]; then
        ninja -C "${BASH_LOCATION}"/build install
    fi
}

main "$@"
