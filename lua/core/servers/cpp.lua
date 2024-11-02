return {
  name = "clangd",
  install_script = [[
    os=$(uname -s | tr "[:upper:]" "[:lower:]")

    case $os in
    linux)
    platform="linux"
    ;;
    darwin)
    platform="mac"
    ;;
    esac

    curl -L -o "clangd.zip" $(curl -s https://api.github.com/repos/clangd/clangd/releases/latest | grep 'browser_' | cut -d\" -f4 | grep "clangd-$platform")

    rm -rf clangd

    unzip -d . clangd.zip

    mv clangd_*/* .

    rm -rf clangd_*
    rm clangd.zip
  ]]
}
