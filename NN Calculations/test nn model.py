#!/usr/bin/env python
# coding: utf-8

# In[1]:


import numpy as np
import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers
import csv


# In[2]:


# define structure

input_dim = 28
rnn_units = 64
output_dim = 10

def build_model():
    model = keras.models.Sequential(
        [
            keras.layers.InputLayer(input_shape=(None, input_dim)),
            keras.layers.LSTM(rnn_units, return_sequences=True),
            keras.layers.GRU(rnn_units, dropout=0.2, return_sequences=True),
            keras.layers.GRU(rnn_units, dropout=0.2),
            keras.layers.BatchNormalization(),
            keras.layers.Dense(output_dim),
        ]
    )
    model.compile(optimizer='adam',
                 loss=tf.keras.losses.SparseCategoricalCrossentropy(from_logits=True),
                 metrics=[tf.keras.metrics.SparseCategoricalAccuracy()])
    return model


# In[3]:


# build model

model = build_model()
model.summary()


# In[4]:


# get training & test data

mnist = keras.datasets.mnist
(x_train, y_train), (x_test, y_test) = mnist.load_data()
x_train, x_test = x_train / 255.0, x_test / 255.0
sample, sample_label = x_train[0], y_train[0]


# In[5]:


# train

batch_size = 64
model.fit(x_train, y_train, validation_data=(x_test, y_test), batch_size=batch_size, epochs=5)


# In[6]:


# get accuracy & output

predictions = model.predict(x_test)
loss, acc = model.evaluate(x_test, y_test, verbose=2)
print("Trained accuracy: {:5.2f}%".format(100 * acc))


# In[8]:


# save NN and output
model.save('test_lstm.h5')
f = open('lstm_output.csv', 'w', newline='')
writer = csv.writer(f)
writer.writerows(predictions)
f.close()


# In[ ]:




