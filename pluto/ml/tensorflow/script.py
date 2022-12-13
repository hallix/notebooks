import tensorflow as tf
import pyarrow as pa
from pyarrow import fs
import pandas as pd


train_X_arrow = pa.memory_map('../datasets/trainX.arrow', 'r')
train_Y_arrow = pa.memory_map('../datasets/trainY.arrow', 'r')
test_X_arrow = pa.memory_map('../datasets/testX.arrow', 'r')
test_Y_arrow = pa.memory_map('../datasets/testY.arrow', 'r')

x_train = pa.ipc.RecordBatchFileReader(train_X_arrow).read_all().to_pandas().to_numpy()
y_train = pa.ipc.RecordBatchFileReader(train_Y_arrow).read_all().to_pandas().to_numpy()
x_test = pa.ipc.RecordBatchFileReader(test_X_arrow).read_all().to_pandas().to_numpy()
y_test = pa.ipc.RecordBatchFileReader(test_Y_arrow).read_all().to_pandas().to_numpy()


#model
model = tf.keras.models.Sequential([
   tf.keras.layers.Dense(3),
   tf.keras.layers.Dense(3, activation='sigmoid'),
   tf.keras.layers.Dense(1, activation='sigmoid'),
])

#test model
sample_x = x_test[:1]
sample_y = y_test[:1]

print('Before training')
prediction = model(sample_x).numpy()
print('0-y\'',model(sample_x).numpy())
print('0-y',sample_y)

print('1-y\'',model(x_test[899:900]).numpy())
print('1-y',y_test[899:900])

#define loss
loss_fn = tf.losses.mse

print(loss_fn(prediction, sample_y))

#optimize model
model.compile("adam", loss=loss_fn, metrics=['accuracy'])

#train model
model.fit(x_train, y_train, epochs=4)

print(model.evaluate(x_test, y_test, verbose=2))

print('After training')
print('0-y\'',model(sample_x).numpy())
print('0-y',sample_y)

print('1-y\'',model(x_test[899:900]).numpy())
print('1-y',y_test[899:900])



