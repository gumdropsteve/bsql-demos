import pynvml

def pull_gpu_id():
    """
    identify the instance's GPU type
        > or alert user this is not a GPU accelerated instance
    """
    # initialize pynvml
    try:
        # will not work on non-gpu accelerated instnace
        pynvml.nvmlInit()

    # unable to initialize pynvml
    except:
        # no GPU detected 
        raise Exception("NO GPU DETECTED\n\n"
                        "Please make sure you've configured Colab to request a GPU instance type.\n\n"
                        "At top of Colab, try: Runtime -> Change runtime type -> Hardware accelerator -> GPU -> Save\n")

    # tag machine
    handle = pynvml.nvmlDeviceGetHandleByIndex(0)
    # locate GPU type/name
    device_name = pynvml.nvmlDeviceGetName(handle)
    # output device name 
    return device_name
    
def colab_gpu_check(my_gpu, compatable_gpus):
    """
    determine if a given GPU is RAPIDS AI compatable
    """
    # allocated K80
    if my_gpu == b'Tesla K80':
        # assuming this is Google Colab
        raise Exception("\nYou've been allocated a K80 instance\n\n"
                        "Unfortunately, this demo requires a T4 instance\n\n"
                        "At top of Colab, try: Runtime -> Reset all runtimes...\n")

    # go through known compatable GPUs
    for gpu in compatable_gpus:
        # check vs our GPU
        if gpu == my_gpu:
            # allocated compatable GPU
            return 'Woo! You got the right kind of GPU!'

    # unknown allocation 
    raise Exception(f"\nYou've achieved wizardy.\nyour GPU is {my_gpu}\n"
                    "Please inform info@blazingsql.com - thank you.")


if __name__ == '__main__':
    # known compatable GPUs
    known_gpus = [b'Tesla T4', b'Tesla P100-PCIE...', b'GeForce GTX']
    # identify GPU
    gpu = pull_gpu_id()
    # check GPU's compatablitiy 
    print(colab_gpu_check(gpu, known_gpus))
