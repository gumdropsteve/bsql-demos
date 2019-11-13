import pynvml
"""
check the colab environment for BlazingSQL and RAPIDS AI compatiblity
prereqs:
  > gpu with pascal architecture & compute capability >= 6.0
    more info: http://bit.ly/rapids-gpus-friend
  > colab translation: Tesla P100 or T4
    more info: http://bit.ly/rapids_in_colab_friend_link
"""
# focus GPU type (check colab settings are correct)
try:
  # start up
  pynvml.nvmlInit()
  # identify handle then extract GPU name
  handle = pynvml.nvmlDeviceGetHandleByIndex(0)
  gpu_name = pynvml.nvmlDeviceGetName(handle)
# not on gpu hardware acceleration
except:
  # error: hardware accelerator 
  raise Exception("\nPlease make sure you've configured Colab to request a GPU instance type.\n\n"
                  "At top of Colab, try: Runtime -> Change runtime type -> Hardware accelerator -> GPU -> Save\n")
# check if allocated K80 instance
if gpu_name == b'Tesla K80':
  # error: compute capability < 6.0
  raise Exception("\nYou've been allocated a K80 instance\n\n"
                  "Unfortunately, colab demos require a T4 or P100 instance\n\n"
                  "At top of Colab, try: Runtime -> Reset all runtimes...\n")
# compatable GPUs that have been available in Colab
compatable_gpus = [b'Tesla P100-PCIE-16GB', b'Tesla T4']
# check if allocated gpu is in list of known compatable GPUs
if gpu_name in compatable_gpus:
  # we're blazing
  print(f'\n\n*********************************\nGPU = {gpu_name}\nWoo! You got the right kind of GPU!\n*********************************\n\n')
# unacknowledged outcome
else:
  # please let us know, thank you
  raise Exception(f"\nYou've achieved wizardy.\nyour GPU is {my_gpu}\nPlease inform info@blazingsql.com")
