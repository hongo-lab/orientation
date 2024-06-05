import tensorflow as tf
from tensorflow.keras.datasets import mnist
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense, Flatten
from tensorflow.keras.utils import to_categorical
import time

# MNISTデータセットをロード
(x_train, y_train), (x_test, y_test) = mnist.load_data()
x_train, x_test = x_train / 255.0, x_test / 255.0

# ラベルをカテゴリカルデータに変換
y_train = to_categorical(y_train, 10)
y_test = to_categorical(y_test, 10)

# モデルの定義
def create_model():
    model = Sequential([
        Flatten(input_shape=(28, 28)),
        Dense(128, activation='relu'),
        Dense(10, activation='softmax')
    ])
    model.compile(optimizer='adam', 
                  loss='categorical_crossentropy', 
                  metrics=['accuracy'])
    return model

# モデルのトレーニングと評価関数
def train_and_evaluate(device, batch_size=128, epochs=10):
    with tf.device(device):
        model = create_model()
        model.summary()
        start_time = time.time()
        model.fit(x_train, y_train, epochs=epochs, batch_size=batch_size, verbose=1)
        elapsed_time = time.time() - start_time
        loss, accuracy = model.evaluate(x_test, y_test, verbose=1)
    return elapsed_time, accuracy

# CPUでのトレーニングと評価
cpu_time, cpu_accuracy = train_and_evaluate('/CPU:0', batch_size=1024, epochs=10)
print(f'CPU Time: {cpu_time:.2f} seconds')
print(f'CPU Accuracy: {cpu_accuracy:.4f}')

# GPUでのトレーニングと評価
gpu_time, gpu_accuracy = train_and_evaluate('/GPU:0', batch_size=1024, epochs=10)
print(f'GPU Time: {gpu_time:.2f} seconds')
print(f'GPU Accuracy: {gpu_accuracy:.4f}')
