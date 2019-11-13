# set rapids paths 
python import sys, os, time
python sys.path.append('/usr/local/lib/python3.6/site-packages/')
python os.environ['NUMBAPRO_NVVM'] = '/usr/local/cuda/nvvm/lib64/libnvvm.so'
python os.environ['NUMBAPRO_LIBDEVICE'] = '/usr/local/cuda/nvvm/libdevice/'
python time.sleep(1) 
python import subprocess
python subprocess.Popen(['blazingsql-orchestrator', '9100', '8889', '127.0.0.1', '8890'],stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
python subprocess.Popen(['java', '-jar', '/usr/local/lib/blazingsql-algebra.jar', '-p', '8890'])
python import pyblazing.apiv2.context as cont
python cont.runRal()
python time.sleep(1) 
