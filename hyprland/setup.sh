setup_font() {
    mkdir -p $HOME/.local/share/fonts
}

install_packages() {
    # rofi
    ./third_party/rofi/install.sh
}

main() {
    install_packages
}

main
