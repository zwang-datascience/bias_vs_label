import pandas as pd
import numpy as np
import os
import time

from sklearn.metrics import roc_curve
from sklearn.metrics import auc
from sklearn.preprocessing import normalize
from sklearn.metrics import confusion_matrix


 
def main():
   
    EPOCH = 20
 
    ftdir = '/project/lsrtwitter/mcooley3/output_data/fasttext/stats/'
    wftdir = '/project/lsrtwitter/mcooley3/output_data/wfasttext/stats/'
    wftcfdir = '/project/lsrtwitter/mcooley3/output_data/wfasttext_cf/stats/'
    wftckdir = '/project/lsrtwitter/mcooley3/output_data/wfasttext_ck/stats/'

    dataset = ['manual', 'train', 'test']
    dirs = [ftdir, wftdir, wftcfdir, wftckdir]

    train_err = pd.DataFrame()
    test_err = pd.DataFrame()
    man_err = pd.DataFrame()
    
    for d in dirs:
        print(d, " ***********************************************")
        num = 0
        
        for filenameft in os.listdir(d):
            #for ds in dataset:
                #if ds in filenameft and "error_" in filenameft:
            if "manual" in filenameft:
                print(filenameft)
                    
                class_error = pd.read_csv(d+filenameft, sep=",", header=None)
                print(class_error)
                    
                class_error = class_error.drop(class_error.columns[-1],axis=1)
                summary = class_error.describe()
                    mean = np.array(summary.loc[['mean']])
                    std = np.array(summary.loc[['std']])
                    mean.resize((EPOCH))
                    std.resize((EPOCH))
                    
                    print()
            
            #print("ERROR")
            #print()
            #print()
            #print()
        
 
if __name__ == '__main__':
    main()
    
    
    
    
    
    