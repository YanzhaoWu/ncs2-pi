# install OpenCV
sudo apt install git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev libatlas-base-dev python3-scipy 

# the specific version can be updated
git clone --depth 1 --branch 4.5.2-openvino https://github.com/opencv/opencv.git

cd opencv && mkdir build && cd build

cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local ..

make -j4
sudo make install

cd ../../

