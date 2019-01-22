#Modified by sarabjeet.singh@ashoka.edu.in

BASEDIR=$(dirname "$0")
BASEDIR=$(cd "$BASEDIR"; pwd)
PIN_ROOT=pin_kit
NVMAIN_ROOT=nvmain
PINVER=pin-2.14-71313-gcc.4.4.7-linux

echo "Installing necessary libraries..."
sudo apt-get install mercurial build-essential gcc-multilib g++-multilib libelfg0-dev libhdf5-serial-dev scons libconfig++-dev libboost-all-dev

if [ ! -d "$PIN_ROOT" ]; then
    echo "Downloading and unpacking PIN tool"
    wget -nv -c "http://software.intel.com/sites/landingpage/pintool/downloads/$PINVER.tar.gz" -O- | tar xz
    echo "Done. PIN tool is downloaded and ready"
    mv "$PINVER" "$PIN_ROOT"
else
    echo "Pin seems to be already installed at $BASEDIR/$PIN_ROOT, skiping"
fi

if [ ! -d "$NVMAIN_ROOT" ]; then
    echo "Cloning NVMain repository..."
    echo "The code is available, but you may need to ask the authors for access to the repo"
    echo "If that doesn't work please contact this script's author to get a copy of the sources."
    hg clone https://bitbucket.org/mrp5060/nvmain $NVMAIN_ROOT
fi

echo "Set up the following environment varaiables:"
echo "Add 'PINPATH=$BASEDIR/$PIN_ROOT' to your environment."
echo "Add 'NVMAINPATH=$BASEDIR/$NVMAIN_ROOT' to your environment."
echo "Add 'ZSIMPATH=$BASEDIR' to your environment."
echo "Add 'LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/path/to/boost/stage/lib' to your environment. Path is usually '/usr/lib'. Find path of libraries by running 'find /usr -iname \"libboost*.so\"'."
echo "Add 'BOOST=/path/to/boost/lib' to your environment. Path is usually '/usr/lib'. Find path of libraries by running 'find /usr -iname \"libboost*.so\"'."
echo "Add 'CC=/usr/bin/gcc' to your environment."
echo "Add 'CXX=/usr/bin/g++' to your environment."
echo "For future aid, add the paths to ~/.bashrc"


exit 0
