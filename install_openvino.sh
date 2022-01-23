# install OpenVINO
git clone --depth 1 --branch 2021.3 https://github.com/openvinotoolkit/openvino.git

cd openvino

git submodule update --init --recursive

sh ./install_build_dependencies.sh

export OpenCV_DIR=/usr/local/lib/arm-linux-gnueabihf/cmake/opencv4

cd ./inference-engine/ie_bridges/python/

pip3 install -r requirements.txt

cd ../../../

mkdir build && cd build

cmake -DCMAKE_BUILD_TYPE=Release \
-DCMAKE_INSTALL_PREFIX=/home/pi/openvino_dist \
-DENABLE_MKL_DNN=OFF \
-DENABLE_CLDNN=OFF \
-DENABLE_GNA=OFF \
-DENABLE_SSE42=OFF \
-DTHREADING=SEQ \
-DENABLE_OPENCV=OFF \
-DNGRAPH_PYTHON_BUILD_ENABLE=ON \
-DNGRAPH_ONNX_IMPORT_ENABLE=ON \
-DENABLE_PYTHON=ON \
-DPYTHON_EXECUTABLE=$(which python3.9) \
-DPYTHON_LIBRARY=/usr/lib/arm-linux-gnueabihf/libpython3.9.so \
-DPYTHON_INCLUDE_DIR=/usr/include/python3.9 \
-DCMAKE_CXX_FLAGS=-latomic ..

make -j4

sudo make install

