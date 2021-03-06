platform=$1  # linux-gnu, darwin*
mode=$2  # install, uninstall

PACKAGE="fastText"
PACKAGE_URL="https://fasttext.cc/"

if [[ $mode == "install" ]]; then
  echo "Installation of $PACKAGE"
  echo "$PACKAGE_URL"

  if [[ $platform == "linux-gnu" ]]; then
    cd ~

    cd /opt
    sudo wget https://github.com/facebookresearch/fastText/archive/v0.1.0.zip
    sudo unzip v0.1.0.zip
    sudo rm v0.1.0.zip
    cd fastText-0.1.0
    sudo make

    # Adding the folder to the path
    cd ~
    echo "
    # added for fasttext
    export PATH=\"/opt/fastText-0.1.0:\$PATH\"" >> .bashrc

    source ~/.bashrc

  elif [[ $platform == "darwin"* ]]; then
    echo "Not implemented"
    exit 1
  fi

  echo "Installation of $PACKAGE complete"

elif [[ $mode == "uninstall" ]]; then
  echo "Uninstallation of $PACKAGE"
  echo "Not implemented"
  exit 1
  echo "Uninstallation of $PACKAGE complete"
fi
