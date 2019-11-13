# set rapids paths 
import sys, os, time
sys.path.append('/usr/local/lib/python3.6/site-packages/')
os.environ['NUMBAPRO_NVVM'] = '/usr/local/cuda/nvvm/lib64/libnvvm.so'
os.environ['NUMBAPRO_LIBDEVICE'] = '/usr/local/cuda/nvvm/libdevice/'

import subprocess
subprocess.Popen(['blazingsql-orchestrator', '9100', '8889', '127.0.0.1', '8890'],stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
subprocess.Popen(['java', '-jar', '/usr/local/lib/blazingsql-algebra.jar', '-p', '8890'])
import pyblazing.apiv2.context as cont
cont.runRal()
time.sleep(1) 
