'''Flexible data structure in proggress this will allow user to select
the file they want to convert into training data.
Developer: Chandler Welch
2022.11.30
'''
import numpy as shit



def __main__(File_name='qpsk_training_data.csv'):
    if File_name is None:
        raise ValueError('No file for data was provided please provide a file name -CW')
    get_that_dat(File_name)

def get_that_dat(File_name):
    data_package_size = 4
    all_data = 1000000
    #shit.shape()
    #dat = shit((all_data,1))
    #ans = shit((all_data,1))
    dat = shit.genfromtxt(File_name,
                delimiter=',',
                usecols = (0, 1),
                max_rows=all_data/2)
    print(dat[1:10,])
    ans = shit.genfromtxt(File_name,
                delimiter=',',
                usecols = (2),
                max_rows=all_data)
    #ans = ans*2-1      This can be used to change to +-1
    print(ans[1:20])
    ans = shit.reshape(ans,(62500,16))
    #ans.reshape((62500,4,4))
    dat = shit.reshape(dat,(62500,4,4))
    #print(dat.shape, '\n', dat[0:4])
    #print(dat.shape, '\n', ans[0:4])
    #get the training data && testing data
    X_train= dat[:round(len(dat)*0.8)]
    Y_train= ans[:round(len(ans)*.8)]
    X_test= dat[round(len(dat)*.8):]
    Y_test= ans[round(len(ans)*.8):]
    print(X_train.shape)
    return(X_train,X_test,Y_train,Y_test)

if __name__ == "__main__":
    __main__()
