# Metric study

This repository contains the instructions, scripts and data to reproduce the simulations of the article entitled *"On the interplay of metrics for throughput and fairness assessment: A simulation-based study"*.


## Installing PBBCache

All simulations are conducted with the open-source multi-platform [PBBCache simulation tool](https://github.com/pbbcache/cachesim). To install this tool on your platform, follow these steps:

1. Clone the PBBCache repository:

    ```bash
    $  git clone git@github.com:pbbcache/cachesim.git 
    ```

2. Make sure that PBBCache v3 is used:

    ```bash
    $ cd cachesim
    $ git checkout 666c8ae
    ```

3. If you are using Linux, make sure that `libblis` is installed (step not required for Mac OS):

    ```bash
    $ sudo apt install libblis3 libblis3-pthread
    ```

4. Create a Python 3 virtual environment with all PBBCache's dependencies:

    ```bash
    ## Create venv
    $ python3 -m venv venv3
    
    ## Activate it
    $ . venv3/bin/activate
    
    ## Upgrade Pip
    $ pip install --upgrade pip
    
    ## Install necesary modules
    $ pip install matplotlib pandas numpy sympy ipyparallel sklearn datetime pytz
    ```


## Running the simulations

Each subfolder in this repository includes a `run_simulations.sh` script to launch the associated simulations. 

That script must be run outside the virtual env created for PBBCache, and with the Ipyparallel cluster properly set up before execution. To launch the simulations do as follows:

1. Go to PBBCache's `simulator` directory and load environment variables:

    ```bash
    $ cd cachesim/simulator
    $ . shrc
    ```

2. Launch IPyparallel cluster with as many workers as needed (e.g., you may use as many workers as the number of cores of your platform -- 32 in the example below): 

    ```bash
    $ ${PBBCACHE}/test/run_venv3.sh ipcluster start -n 32 --daemonize
    ```


3. Go to the directory of the simulations you want to run and execute the scripts:

    ```bash
    $ cd ${REPO_ROOT}/simulations-AMD-rome
    $ ./run_simulations.sh
    ```

4. Check the results under the `results` directory


5. Stop Ipyparallel cluster:

    ```bash
    $ ${PBBCACHE}/test/run_venv3.sh ipcluster stop
    ```
    
    
    
    

  
