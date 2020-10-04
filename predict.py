#!/usr/bin/env python
import numpy as np
from keras.models import Sequential
from keras.layers import Dense, Activation,Dropout
from keras.layers import Conv1D, GlobalAveragePooling1D, MaxPooling1D
from keras.optimizers import Adam
import h5py
import sys
import os
from keras import regularizers
from keras.models import load_model
def main():
    
    argc = len(sys.argv)
    argv = sys.argv
    
    aa_onehot=h5py.File(argv[2]+'aa_onehot.mat')
    aa_property=h5py.File(argv[2]+'aa_property.mat')
    aa_length=40
    aa_onehot=aa_onehot['aa_onehot'][:]
    aa_property=aa_property['aa_property'][:]
   
    a=aa_onehot.shape[0]
    a=np.array(a)
    a=a.astype('int64')
    num=a/aa_length

    aa_onehot = aa_onehot.reshape(num, aa_length, 20)
    aa_property = aa_property.reshape(num, aa_length, 22)

    model=load_model(argv[1])
    predict = model.predict([aa_onehot,aa_property])
    np.savetxt(argv[2]+'predict.csv',predict)
    del model
    

if __name__=="__main__":
    main()
