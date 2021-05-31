# VirionFinder
VirionFinder: identification of complete and partial phage virion proteins from virome data using the sequence logos and biochemical properties of amino acids

* [Introduction](#introduction)
* [Version](#version)
* [Requirements](#requirements)
* [Installation](#installation)
* [Usage](#usage)
* [Output](#output)
* [Citation](#citation)
* [Contact](#contact)
    

## Introduction

VirionFinder is designed to distinguish the phage virion proteins (PVPs) from the non-phage virion proteins in the viral metageomic data. It takes a "fasta" file that contains the protein sequences as input and outputs a tabular file with PVP annotation for each sequence. VirionFinder can run either on the virtual machine or physical host. For non-computer professionals, we recommend running the virtual machine version of VirionFinder on local PC. In this way, users do not need to install any dependency package. If GPU is available, you can also choose to run the physical host version. This version can automatically speed up with GPU and is more suitable to handle large scale data.

## Version
+ VirionFinder 1.0 (Tested on Ubuntu 16.04)

## Requirements
------------

+ [Python 2.7.12](https://www.python.org/)
+ [numpy 1.13.1](http://www.numpy.org/)
+ [h5py 2.6.0](http://www.h5py.org/)
+ [TensorFlow 1.4.1](https://www.tensorflow.org/)
+ [Keras 2.0.8](https://keras.io/)
+ [MATLAB Component Runtime (MCR) R2018a](https://www.mathworks.com/products/compiler/matlab-runtime.html) or [MATLAB R2018a](https://www.mathworks.com/products/matlab.html)

  **Note:**
(1) VirionFinder should be run under Linux operating system.
(2) For compatibility, we recommend installing the tools with the similar version as described above.
(3) If GPU is available in your machine, we recommend installing a GPU version of the TensorFlow to speed up the program.
(4) VirionFinder can be run with either an executable file or a MATLAB script. If you run VirionFinder through the executable file, you need to install the MCR (for free) while MATLAB is not necessary. If you run VirionFinder through the MATLAB script, MATLAB is required.



## Installation
### 1 Prerequisites
  
  First, please install **numpy, h5py, TensorFlow** and **Keras** according to their manuals. All of these are python packages, which can be installed with ``pip``. If “pip” is not already installed in your machine, use the command “sudo apt-get install python-pip python-dev” to install “pip”. Here are example commands of installing the above python packages using “pip”.
    
    pip install numpy
    pip install h5py
    pip install tensorflow==1.4.1  #CPU version
    pip install tensorflow-gpu==1.4.1  #GPU version
    pip install keras==2.0.8
    
  If you are going to install a GPU version of the TensorFlow, specified NVIDIA software should be installed. See https://www.tensorflow.org/install/install_linux to know whether your machine can install TensorFlow with GPU support.  
  
  When running VirionFinder through the executable file, MCR should be installed. See https://www.mathworks.com/help/compiler/install-the-matlab-runtime.html to install MCR. On the target computer, please append the following to your LD_LIBRARY_PATH environment variable according to the tips of MCR:
  
    <MCR_installation_folder>/v94/runtime/glnxa64
    <MCR_installation_folder>/v94/bin/glnxa64
    <MCR_installation_folder>/v94/sys/os/glnxa64
    <MCR_installation_folder>/v94/extern/bin/glnxa64
    
  When running VirionFinder through the MATLAB script, please see https://www.mathworks.com/support/ to install the MATLAB.  
 
  
### 2 Install VirionFinder using git
  
  Clone VirionFinder package
  
    git clone https://github.com/zhenchengfang/VirionFinder.git
    
  Change directory to VirionFinder:
  
    cd VirionFinder
    
  The executable file and all scripts are under the folder
  
### 3 If you are non-computer professionals who unfamiliar with the Linux operating system, we recommend using the virtual machine of VirionFinder. In this way, you do not need to install any dependant packages as mentioned above.

## Usage

### 1. Run VirionFinder using executable file (in command line)

  Please simply execute the command:
  
    ./VirionFinder <input_file_folder>/input_file.faa <output_file_folder>/output_file.csv
    
  The input file must be in fasta format containing the sequences to be identified. For example, users can use the file "example.faa" in the folder to test VirionFinder by simply executing the command:
  
    ./VirionFinder example.faa result.csv
    
### 2. Run VirionFinder using MATLAB script (in MATLAB GUI)

  Please execute the following command directly in MATLAB command window:
  
    VirionFinder('<input_file_folder>/input_file.faa','<output_file_folder>/output_file.csv')
    
  For example, if you want to identify the sequences in "example.fna", please execute:
  
    VirionFinder('example.faa','result.csv')
    
  Please remember to set the working path of MATLAB to VirionFinder folder before running the programe.
  

### 3. Run VirionFinder over a large file (-b option)

  If the RAM of your machine is small, or your file is very large, you can you -b option to let the program read the file in block to reduce the memory requirements and speed up the program. For example, if you want to let the program to predict 1000 sequences at a time, please execute:
  
    ./VirionFinder example.faa result.csv -b 1000 (by executable file)
    or
    VirionFinder('example.faa','result.csv','-b','1000') (by MATLAB script)
    
The default value of -b is 10000.

### 4. Virtual machine version
The installation of the virtual machine is much easier. Please refer to 'Manual.pdf' for a step by step guide with screenshot to see how to install the virtual machine.

  
## Output

The output of VirionFinder consists of four columns:

Header | Length | Score | Prediction |
------ | ------ | ----- | --------------- |

A protein with a higher score is more likely to be a PVP. By default, a protein with a score higher than 0.5 will be predicted as PVP.


**Note:**
(1) The current version of VirionFinder uses “comma-separated values (CSV)” as the format of the output file. Please use “.csv” as the extension of the output file. VirionFinder will automatically add the “.csv” extension to the file name if the output file does not take “.csv” as its extension”.
(2) The program allows run mutiple tasks in parallel. However, running mutiple same tasks (with the same input file under the same '-b' setting will throw error. 


# Citation
+ VirionFinder: identification of complete and partial phage virion proteins from virome data using the sequence logos and biochemical properties of amino acids


# Contact
Any question, please do not hesitate to contact me: fangzc@smu.edu.cn

