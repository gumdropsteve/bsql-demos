#!/bin/bash

set -eu

wget -nc https://raw.githubusercontent.com/gumdropsteve/bsql-demos/feature_utils/utils/colab-gpu-check.py
echo "Checking for GPU type:"
python colab-gpu-check.py
