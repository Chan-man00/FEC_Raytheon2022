# this is the code for the machine learning model.
import numpy as np
import tensorflow as tf
from tensorflow import keras
from keras import layers as lay
#from prompt_toolkit.input.typeahead import Input
from keras.utils import plot_model
from keras.models import Model
#from keras.layers import Dense
#from keras.layers.recurrent import LSTM

#these are properties of the compiler
opt = tf.keras.optimizers.Adam(learning_rate=0.0001)
loser = tf.keras.losses.BinaryCrossentropy()
met = tf.keras.metrics.Hinge()
# This is where the network will be trained.
#model = keras.Sequential()





## NERUAL NET
from numpy import array 
import numpy as np
#this is the size of input matrix times 2 for real and im data
data_package_size = 4
all_data = 1000000
#shit.shape()
#dat = shit((all_data,1))
#ans = shit((all_data,1))
dat = np.genfromtxt('qpsk_training_data.csv',
              delimiter=',',
              usecols = (0, 1),
              max_rows=all_data/2)
#print(dat[1:10,])
ans = np.genfromtxt('qpsk_training_data.csv',
              delimiter=',',
              usecols = (2),
              max_rows=all_data)
#ans = ans*2-1
#print(ans[1:20])
# Note-- we want to mormalize data, easiest way is find max and divide all values by max.

#this will set the variables to be Normalized.
# This sets the heading for the data



#Reshap the data into 16 len arrays
# original shape 1x1M
ans = np.reshape(ans,(62500,16))
#ans.reshape((62500,4,4))
dat = np.reshape(dat,(62500,4,4))
#print(dat.shape, '\n', dat[0:4])
#print(dat.shape, '\n', ans[0:4])
#get the training data && testing data
X_train= dat[:round(len(dat)*0.8)]
Y_train= ans[:round(len(ans)*.8)]
X_test= dat[round(len(dat)*.8):]
Y_test= ans[round(len(ans)*.8):]
#print(X_train.shape)



def train_NN(Chandlers_cool=None):
    # Add an Embedding layer expecting input vocab of size 1000, and
    # output embedding dimension of size 64.
    # model.add(layers.Embedding(input_dim=16, output_dim=1,))
    variables = (lay.Input(shape=[4,4]))
    #print(model.summary())
    input_layer = lay.Dense(16,input_dim=4, activation='relu')(variables)
    #input_layer_1 = model.add(layers.Dense(5*input_dim, activation='relu'))(variables)
    #input_layer_2 = model.add(layers.Dense(5*input_dim, activation='relu')))(input_layer_1)
    #input_layer_3 = model.add(layers.Dense(5*input_dim, activation='relu'))')(input_layer_2)
    #input_layer_4 = model.add(layers.Dense(5*input_dim, activation='relu'))')(input_layer_3)
    # Add a LSTM layer with 128 internal units.
    #model.add(layers.LSTM(128))
    # Add GRU 
    # These will use sequences of the rows and columns. like a time stamp

    input_layer_1 = lay.GRU(256,input_shape=X_train.shape[1:],
    return_sequences=True,activation='relu',recurrent_activation='tanh',
    dropout=0.2)(variables) #,return_state=True
    #input_drop_1 = lay.GaussianDropout()
    input_layer_2 = lay.GRU(256,return_sequences=True, 
    activation='relu',recurrent_activation='tanh',dropout=0.2)(input_layer_1)
    #bi_lay = input_layer_2.Bidirectional(backward_layer=input_layer_1)
    input_layer_3 = lay.GRU(256, return_sequences=True,
    activation='relu',recurrent_activation='tanh',dropout=0.2)(input_layer_2)

    input_layer_4 = lay.GRU(128, return_sequences=False, activation='relu'
    ,recurrent_activation='tanh',dropout=0.2)(input_layer_3)

    output_layer = lay.Dense(16, activation='sigmoid')(input_layer_4)#interm)
    #binary_layer = lay.log
    model = Model(inputs=variables, outputs=output_layer)
    #model.add(layers.Dense(16))
    model.summary()
    model.compile(optimizer=opt,
                loss=loser,
                metrics=[tf.keras.metrics.Precision()])
    #opt, , metrics=['accuracy'])
    #keras.metrics.Precision
    #tf.keras.utils.plot_model(model, to_file='recurrent_neural_network.png')
    model.fit(X_train,Y_train, validation_data=(X_test, Y_test), epochs=10, verbose='auto')
    model.evaluate(X_test, Y_test, verbose='auto')

    # successfull_code_words = 0
    # No_errors = True
    # while No_errors:
    #     pred = model.predict(X_test[successfull_code_words][0:])
    #     #print(pred)
    #     prediction = []
    #     pred = pred[0]
    #     for i in range(0,15):
    #         if pred[i]>0.5:
    #             prediction.append(1)
    #         else:
    #             prediction.append(0)
    #         Y_test[0:1][0:]
    # print(prediction)
    # print()
    model.save('DecoderNetGRU')

#train_NN()