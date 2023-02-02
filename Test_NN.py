import numpy as np
from tensorflow import keras
from Train_Neural_Net import X_test,Y_test

model = keras.models.load_model('DecoderNetGRU')
#This will load the saved model

prediction = model.predict(X_test[0:][0:])
#this will predict all the test pieces of data.
Y_test[0:][0:] #This is all the correct answers


errors =0
successfull_code_words = 0
No_errors = True
while successfull_code_words<len(Y_test):
    #this while loop will go though all the data to see how many errors.
    #print(pred)
    anser = Y_test[successfull_code_words]
    pred = prediction[successfull_code_words]
    #print(anser,prediction)
    for i in range(0,15):
        if pred[i]>0.5:
            if anser[i] != 1:
                #print(pred[i],anser[i])
                errors+=1
                No_errors = False
        elif pred[i]<=0.5:
            if anser[i] != 0:
                #print(pred[i],anser[i])
                errors +=1
                No_errors = False
    successfull_code_words+=1
        
print('Total bits transmitted {}\ntotal errors in recieved data {}'
.format(successfull_code_words*16,errors))
print('The percent error in the recieved data is {} %'
.format(errors/(len(Y_test)*16)))


