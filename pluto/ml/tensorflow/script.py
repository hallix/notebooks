import tensorflow as tf
import pyarrow as pa
from pyarrow import fs
import pandas as pd
import numpy as np

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
   tf.keras.layers.Dense(9, activation='relu'),
   tf.keras.layers.Dense(2, activation="softmax"),
])

#test model
sample_x = x_test[:10]
sample_y = y_test[:10]
print(sample_x)
print(sample_y)

print('Before training')
print('y\'',model.predict(sample_x))
print('y',sample_y)

#define loss
loss_fn = tf.losses.binary_crossentropy

#optimize model
opt = tf.keras.optimizers.Adam(learning_rate=0.05)
model.compile(optimizer=opt, loss=loss_fn, metrics=['accuracy'])

#train model
model.fit(x_train, y_train,epochs=50, batch_size=500)

print(model.evaluate(x_test, y_test, verbose=2))

print('After training')
print('y\'',model(sample_x).numpy())
print('y',sample_y)


print("Num GPUs Available: ", len(tf.config.experimental.list_physical_devices('GPU')))
