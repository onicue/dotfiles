return {
  alias = "cmake",
  name = "cmake-language-server",
  install_script = [[
    python3 -m venv .
    ./bin/pip3 install -U pip
    ./bin/pip3 install -U cmake-language-server
  ]]
}
