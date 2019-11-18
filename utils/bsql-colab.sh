echo ""
echo "Installing BlazingSQL from the stable release channel"
echo "Please standby, this will take a few minutes..."
echo ""

conda install -y --prefix /usr/local -c blazingsql/label/cuda10.0 -c blazingsql -c rapidsai -c conda-forge -c defaults blazingsql-calcite blazingsql-orchestrator blazingsql-ral blazingsql-python cudatoolkit=10.0

pip install flatbuffers

echo ""
echo "***********************************************"
echo "Your Google Colab instance is BlazingSQL ready!"
echo "***********************************************"
