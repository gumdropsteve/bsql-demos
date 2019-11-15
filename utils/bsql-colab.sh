#!/bin/bash

set -eu

# check for compatable GPU
wget -nc https://github.com/gumdropsteve/bsql-demos/raw/feature/utils/utils/colab_env.py
echo "Checking for GPU type:"
python colab_env.py

# install RAPIDS AI
wget -nc https://github.com/rapidsai/notebooks-contrib/raw/master/utils/rapids-colab.sh
bash rapids-colab.sh

# install BlazingSQL
echo "Installing BlazingSQL"
echo "Please standby, this may take a few minutes..."
conda install -y --prefix /usr/local -c blazingsql/label/cuda10.0 -c blazingsql -c rapidsai -c conda-forge -c defaults blazingsql-calcite blazingsql-orchestrator blazingsql-ral blazingsql-python
pip install flatbuffers
fi

echo ""
echo "********************************************************"
echo "Your Google Colab instance is BlazingSQL + RAPIDS ready!"
echo "********************************************************"
