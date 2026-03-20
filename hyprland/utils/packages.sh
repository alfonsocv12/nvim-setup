install_from_list() {
    local list="$1"

    cut -f1 -d' ' "${list}" | xargs sudo apt install
}
