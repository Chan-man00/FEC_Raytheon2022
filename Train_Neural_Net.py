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
opt = tf.keras.optimizers.Adam(learning_rate=0.001)
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

'''dat_20db = np.genfromtxt('training_20db.csv',
              delimiter=',')#, usecols = (0, 1), max_rows=all_data/2-32
dat_20db[0:][0][:63] = dat_20db[0:][0][:63]/max(dat_20db.max(),abs(dat_20db.min())) #dat.max()

dat_15db = np.genfromtxt('training_15db.csv',
              delimiter=',')#, usecols = (0, 1), max_rows=all_data/2-32
dat_15db[0:][0][:63] = dat_15db[0:][0][:63]/max(dat_15db.max(),abs(dat_15db.min())) #dat.max()


dat_10db = np.genfromtxt('training_10db.csv',
              delimiter=',')#, usecols = (0, 1), max_rows=all_data/2-32
dat_10db[0:][0][:63] = dat_10db[0:][0][:63]/max(dat_10db.max(),abs(dat_10db.min())) #dat.max()

dat_7db = np.genfromtxt('training_7db.csv',
              delimiter=',')#, usecols = (0, 1), max_rows=all_data/2-32
dat_7db[0:][0][:63] = dat_7db[0:][0][:63]/max(dat_7db.max(),abs(dat_7db.min())) #dat.max()'''

dat_5db = np.genfromtxt('training_5db.csv',
              delimiter=',')#, usecols = (0, 1), max_rows=all_data/2-32
dat_5db[0:][0][:63] = dat_5db[0:][0][:63]/max(dat_5db.max(),abs(dat_5db.min())) #dat.max()

dat_3db = np.genfromtxt('training_3db.csv',
              delimiter=',')#, usecols = (0, 1), max_rows=all_data/2-32
dat_3db[0:][0][:63] = dat_3db[0:][0][:63]/max(dat_3db.max(),abs(dat_3db.min())) #dat.max()

'''dat_1db = np.genfromtxt('training_1db.csv',
              delimiter=',')#, usecols = (0, 1), max_rows=all_data/2-32
dat_1db[0:][0][:63] = dat_1db[0:][0][:63]/max(dat_1db.max(),abs(dat_1db.min())) #dat.max()

dat_0db = np.genfromtxt('training_0db.csv',
              delimiter=',')#, usecols = (0, 1), max_rows=all_data/2-32
dat_0db[0:][0][:63] = dat_0db[0:][0][:63]/max(dat_0db.max(),abs(dat_0db.min())) #dat.max()

dat = np.append(dat_20db,dat_15db,dat_10db,dat_7db,dat_5db,dat_3db,dat_1db,dat_0db)'''
dat = np.append(dat_3db,dat_5db,axis=0)
print(dat[0:1][0][1:99])
'''ans_20 = np.genfromtxt('answer_20db.csv',#dtype=int(),
              delimiter=',')#, usecols = (2), max_rows=all_data-322624
ans_15 = np.genfromtxt('answer_15db.csv',#dtype=int(),
              delimiter=',')#, usecols = (2), max_rows=all_data-322624

ans_10 = np.genfromtxt('answer_10db.csv',
              delimiter=',')#, usecols = (2), max_rows=all_data-
ans_7 = np.genfromtxt('answer_7db.csv',#dtype=int(),
              delimiter=',')#, usecols = (2), max_rows=all_data-322624   '''
ans_5 = np.genfromtxt('answer_5db.csv',#dtype=int(),
              delimiter=',')#, usecols = (2), max_rows=all_data-322624
ans_3 = np.genfromtxt('answer_3db.csv',#dtype=int(),
              delimiter=',')#, usecols = (2), max_rows=all_data-322624

'''ans_1 = np.genfromtxt('answer_1db.csv',#dtype=int(),
              delimiter=',')#, usecols = (2), max_rows=all_data-322624

ans_0 = np.genfromtxt('answer_0db.csv',
              delimiter=',')#, usecols = (2), max_rows=all_data-322624   '''

ans = np.append(ans_5,ans_3,axis=0)# ans_20,ans_15,ans_10,ans_7,,ans_1,ans_0
#normalizing the data that is input.
#dat[0:][0][:63] = dat[0:][0][:63]/max(dat.max(),abs(dat.min())) #dat.max()
#ans = (ans*2)-1
#print(ans[0:1][0])
#print(dat[0:][0][0:63],'this is it', dat.min())


#ans = np.reshape(ans,(32253,63))
# #ans.reshape((62500,4,4))
# dat = np.reshape(dat,(10752,1,93))
#print(dat.shape, '\n', dat[0:4])
#print(dat.shape, '\n', ans[0:4])
#get the training data && testing data
#dat = dat[0:10000]
#ans = ans[0:10000]
#print(ans.shape, dat.shape)
X_train= dat[:round(len(dat)*0.8)]
Y_train= ans[:round(len(ans)*.8)]
X_test= dat[round(len(dat)*.8):]
Y_test= ans[round(len(ans)*.8):]
print(X_train.shape, Y_train.shape)
#X_train=np.transpose(X_train)

'''def train_NN(Chandlers_cool=None):
    # Add an Embedding layer expecting input vocab of size 1000, and
    # output embedding dimension of size 64.
    # model.add(layers.Embedding(input_dim=16, output_dim=1,))
    variables = (lay.Input(shape=[4,4]))
    input_layer_1 = lay.GRU(128,input_shape=X_train.shape[1:],
    return_sequences=True,activation='relu',recurrent_activation='tanh',
    dropout=0.2)(variables) #,return_state=True
    #input_drop_1 = lay.GaussianDropout()
    input_layer_2 = lay.GRU(128,return_sequences=True, 
    activation='relu',recurrent_activation='tanh',dropout=0.2)(input_layer_1)
    #bi_lay = input_layer_2.Bidirectional(backward_layer=input_layer_1)
    input_layer_3 = lay.GRU(128, return_sequences=True,
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
    model.fit(X_train,Y_train, validation_data=(X_test, Y_test), epochs=20, verbose='auto')
    model.evaluate(X_test, Y_test, verbose='auto')
    model.save('DecoderNetGRU')
'''
print(X_train.shape[0:])
def train_NN(Chandlers_cool=True):
    if not chandlers_cool:
        with tf.device('/GPU:0'):
            variables = lay.Input(shape=(99,1))
            #dence_in = lay.Dense(99,input_dim=3,input_shape=(99,),activation='relu')(variables)
            input_layer_1 = lay.GRU(256, activation='tanh',recurrent_activation='relu', return_sequences=True, input_shape=(99, 1),
                                    dropout=.2,recurrent_dropout=0.0)(variables)
            '''input_layer_1 = lay.GRU(256,
            return_sequences=True,activation='relu',recurrent_activation='tanh',
            dropout=0.0,go_backwards=False,return_state=True )(variables) '''# input_layer   input_shape=[X_train.shape[1], X_train.shape[2]],
            #input_drop_1 = lay.GaussianDropout()

            #Changing activation from relu to tanh and recurrent activation to relu

            #input_layer_2 = lay.GRU(256,return_sequences=True, 
            #activation='tanh',recurrent_activation='relu',dropout=0.0,go_backwards=True)(input_layer_1)

            #bi_lay = input_layer_2.Bidirectional(backward_layer=input_layer_1)
            input_layer_3 = lay.GRU(256, return_sequences=True,
            activation='tanh',recurrent_activation='relu',dropout=.20, recurrent_dropout=.0 ,go_backwards=True)(input_layer_1)
            input_layer_4 = lay.GRU(256, return_sequences=True, activation='tanh'
            ,recurrent_activation='relu',dropout=.20, recurrent_dropout=0.0 ,go_backwards=True)(input_layer_3)
            input_layer_5 = lay.GRU(128, return_sequences=False, activation='tanh'
            ,recurrent_activation='relu',dropout=.20, recurrent_dropout=0.0 ,go_backwards=True)(input_layer_4)

            output_layer = lay.Dense(63, activation='relu')(input_layer_5)#interm)
            model = Model(inputs=variables, outputs=output_layer)
            model.summary()
            model.compile(optimizer=tf.keras.optimizers.Adam(learning_rate=1e-8),
                    loss=tf.keras.losses.BinaryCrossentropy(),
                    metrics=[tf.keras.metrics.BinaryAccuracy(),
                            tf.keras.metrics.FalseNegatives(), tf.keras.metrics.FalsePositives()])
            model.fit(X_train,Y_train, validation_data=(X_test, Y_test), epochs=20)
            model.evaluate(X_test, Y_test, verbose='auto')
            model.save('GRU.V.3.01.h5',save_format='h5')
        else:
            print('Chandler cannot be cool to train a new model.')
if __name__ == '__main__':
    train_NN()




############# Notes #########################
#so far the best performing model is tanh dense output with -1,1 input values.
'''optimizer=opt, loss=[keras.losses.BinaryCrossentropy()], metrics=[tf.keras.metrics.BinaryAccuracy()], )'''
#print(dat.max())
