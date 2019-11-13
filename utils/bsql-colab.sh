#!/bin/bash

set -eu

if [ ! -f Miniconda3-4.5.4-Linux-x86_64.sh ]; then
    echo "Removing conflicting packages, will replace with RAPIDS compatible versions"
    # remove existing xgboost and dask installs
    pip uninstall -y xgboost dask distributed

    # intall miniconda
    echo "Installing conda"
    wget https://repo.continuum.io/miniconda/Miniconda3-4.5.4-Linux-x86_64.sh
    chmod +x Miniconda3-4.5.4-Linux-x86_64.sh
    bash ./Miniconda3-4.5.4-Linux-x86_64.sh -b -f -p /usr/local
    
    echo "Installing RAPIDS packages"
    echo "Please standby, this will take a few minutes..."
    # install RAPIDS packages
    conda install -y --prefix /usr/local \
      -c rapidsai/label/xgboost -c rapidsai -c nvidia -c conda-forge \
      python=3.6 cudatoolkit=10.0 \
      cudf=0.9.* cuml=0.9.* cugraph=0.9.* gcsfs pynvml \
      dask-cudf=0.9.* \
      rapidsai/label/xgboost::xgboost=>0.9
      
    echo "Copying shared object files to /usr/lib"
    # copy .so files to /usr/lib, where Colab's Python looks for libs
    cp /usr/local/lib/libcudf.so /usr/lib/libcudf.so
    cp /usr/local/lib/librmm.so /usr/lib/librmm.so
    cp /usr/local/lib/libxgboost.so /usr/lib/libxgboost.so
    cp /usr/local/lib/libnccl.so /usr/lib/libnccl.so
    # Install BlazingSQL for CUDA 10.0
    conda install -y --prefix /usr/local -c rapidsai -c nvidia -c conda-forge -c felipeblazing/label/cuda10.0 python=3.6 cudatoolkit=10.0 blazingsql-ral blazingsql-orchestrator blazingsql-calcite blazingsql-python


    pip install flatbuffers
fi
echo ""
echo "*********************************************"
echo "Your Google Colab instance is RAPIDS ready!"
echo "*********************************************"



echo ""
echo "*********************************************"
echo "Your Google Colab instance is BlazingSQL ready!"
echo "*********************************************"
