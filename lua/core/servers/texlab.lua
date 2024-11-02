return {
  name = "texlab",
  install_script = [[
    curl -L -o "texlab.tar.gz" "https://github.com/latex-lsp/texlab/releases/download/v5.20.0/texlab-x86_64-linux.tar.gz"

    rm -rf texlab
    tar -xzf texlab.tar.gz
    mv texlab_*/* .

    rm -rf texlab_*
    rm texlab.tar.gz
  ]]
}
